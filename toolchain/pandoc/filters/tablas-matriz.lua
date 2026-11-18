-- ==============================================================================
-- tablas-matriz.lua — Filtro de pandoc: matrices 2x2 de 4 cuadrantes, tablas
--                     con cuadrícula completa y alineación vertical en tablas
--                     (PDF/LuaLaTeX y EPUB/HTML).
--
-- EL PROBLEMA
--   1. Por defecto, pandoc compila todas las tablas en LaTeX con booktabs
--      (\toprule, \midrule solo tras la fila 1, \bottomrule), sin líneas
--      verticales ni divisiones entre filas del cuerpo. En matrices 2x2 (como la
--      Matriz de McFarlan), los cuadrantes inferiores quedan visualmente sueltos.
--   2. Markdown GFM tampoco tiene sintaxis nativa para alineación vertical
--      (arriba / medio / abajo).
--
-- CÓMO SE USA
--   Colocar un comentario HTML invisible justo antes de una tabla Markdown GFM:
--     - <!-- matriz-2x2 --> : Tabla de 2 columnas x 4 filas donde las filas 1 y 3
--                             son títulos de cuadrantes y las filas 2 y 4 su
--                             contenido (4 cuadrados con bordes y encabezados).
--     - <!-- cuadricula --> : Cualquier tabla NxM con bordes completos en todas
--                             sus celdas y encabezado sombreado.
--     - <!-- valign=middle --> (o <!-- tabla valign=middle -->) :
--                             Alineación vertical en tablas GFM comunes (booktabs).
--
--   Modificadores opcionales combinables en el mismo comentario:
--     - valign=top|middle|bottom  (aliases: arriba, medio/centro, abajo)
--     - hvalign=top|middle|bottom (alineación vertical específica del encabezado)
--     Ejemplos: <!-- cuadricula valign=middle -->
--               <!-- cuadricula hvalign=middle -->
--               <!-- matriz-2x2 valign=middle -->
--
--   Debe cargarse DESPUÉS de tablas-listas.lua en pdf.yaml y epub.yaml para que
--   las viñetas "•" ya estén convertidas en listas nativas.
-- ==============================================================================

local VALIGN_MAP = {
  top = 'p',
  arriba = 'p',
  middle = 'm',
  center = 'm',
  medio = 'm',
  centro = 'm',
  bottom = 'b',
  abajo = 'b',
}

local VALIGN_CSS = {
  p = 'top',
  m = 'middle',
  b = 'bottom',
}

local ALIGN_CMD = {
  AlignCenter = '\\centering',
  AlignRight = '\\raggedleft',
  AlignLeft = '\\raggedright',
  AlignDefault = '\\raggedright',
}

local function parse_marker(block)
  if not block or block.t ~= 'RawBlock' or block.format ~= 'html' then
    return nil
  end
  local inner = block.text:match('^%s*<!%-%-(.-)%-%->%s*$')
  if not inner then
    return nil
  end

  local kind = nil
  local valign = nil
  local hvalign = nil
  local token_count = 0

  for raw_tok in inner:gmatch('%S+') do
    token_count = token_count + 1
    local tok = raw_tok:lower()
    if tok == 'matriz-2x2' then
      if kind then return nil end
      kind = 'matriz-2x2'
    elseif tok == 'cuadricula' or tok == 'cuadrícula' then
      if kind then return nil end
      kind = 'cuadricula'
    elseif tok == 'tabla' then
      if kind then return nil end
      kind = 'tabla'
    else
      local key, val = tok:match('^(h?valign)[=:%-](.+)$')
      local mapped = val and VALIGN_MAP[val] or nil
      if not key or not mapped then
        return nil
      end
      if key == 'valign' then
        valign = mapped
      else
        hvalign = mapped
      end
    end
  end

  if token_count == 0 then
    return nil
  end
  if not kind and not valign and not hvalign then
    return nil
  end

  return {
    kind = kind or 'tabla',
    valign = valign,
    hvalign = hvalign,
  }
end

local function collect_rows(tbl)
  local rows = pandoc.List()
  for _, r in ipairs(tbl.head.rows) do
    rows:insert(r)
  end
  for _, body in ipairs(tbl.bodies) do
    for _, r in ipairs(body.head) do
      rows:insert(r)
    end
    for _, r in ipairs(body.body) do
      rows:insert(r)
    end
  end
  for _, r in ipairs(tbl.foot.rows) do
    rows:insert(r)
  end
  return rows
end

local function latex_align_cmd(cell, col_spec)
  local align = (cell and cell.alignment and cell.alignment ~= 'AlignDefault')
    and cell.alignment
    or (col_spec and col_spec[1])
    or 'AlignDefault'
  return ALIGN_CMD[align] or '\\raggedright'
end

local function cell_text_stats(cell)
  local txt = pandoc.utils.stringify(pandoc.Div(cell.contents)) or ''
  txt = txt:gsub('^%s+', ''):gsub('%s+$', '')
  local longest_word = 0
  for w in txt:gmatch('%S+') do
    local lw = utf8.len(w) or #w
    if lw > longest_word then
      longest_word = lw
    end
  end
  local nchars = utf8.len(txt) or #txt
  return nchars, longest_word
end

local function compute_col_fractions(tbl, kind, ncols, rows, header_count)
  local fracs = {}
  if kind == 'matriz-2x2' then
    for idx = 1, ncols do
      fracs[idx] = 0.5
    end
    return fracs
  end

  local sum_w = 0
  local min_w = math.huge
  local max_w = 0
  local has_all_widths = true
  for idx = 1, ncols do
    local w = tbl.colspecs[idx][2]
    if w and w > 0 then
      sum_w = sum_w + w
      if w < min_w then min_w = w end
      if w > max_w then max_w = w end
    else
      has_all_widths = false
    end
  end

  if has_all_widths and sum_w > 0 and min_w > 0 and (max_w / min_w) > 1.35 then
    for idx = 1, ncols do
      fracs[idx] = tbl.colspecs[idx][2] / sum_w
    end
    return fracs
  end

  -- Sin anchos diferenciados explícitos en GFM: ponderar según contenido real
  -- para no estrechar columnas descriptivas ni partir palabras sueltas en columnas angostas.
  local weights = {}
  local col_min = {}
  local w_sum = 0
  for idx = 1, ncols do
    local head_chars = 0
    local max_word = 0
    local body_chars_sum = 0
    local body_rows = 0
    for r_idx, row in ipairs(rows) do
      local nc, lw = cell_text_stats(row.cells[idx])
      if lw > max_word then max_word = lw end
      if r_idx <= header_count then
        if nc > head_chars then head_chars = nc end
      else
        body_chars_sum = body_chars_sum + nc
        body_rows = body_rows + 1
      end
    end
    local avg_body = body_rows > 0 and (body_chars_sum / body_rows) or head_chars
    local word_cap = math.min(max_word, 16)
    -- Ancho mínimo aproximado para que la palabra más larga del encabezado/código quepa sin desbordar (en 11pt sobre ~470pt)
    col_min[idx] = math.max(0.085, math.min(0.24, (word_cap * 6.1 + 22) / 470))
    local eff = math.max(head_chars * 0.65, word_cap * 1.15, avg_body)
    weights[idx] = math.max(2.0, eff ^ 0.56)
    w_sum = w_sum + weights[idx]
  end

  local max_possible_min = 0.75 / ncols
  for idx = 1, ncols do
    col_min[idx] = math.min(col_min[idx], max_possible_min)
    fracs[idx] = weights[idx] / w_sum
  end
  for _ = 1, 4 do
    local fixed = 0
    local free_sum = 0
    for idx = 1, ncols do
      if fracs[idx] <= col_min[idx] then
        fracs[idx] = col_min[idx]
        fixed = fixed + col_min[idx]
      else
        free_sum = free_sum + fracs[idx]
      end
    end
    if free_sum > 0 and fixed < 1 then
      local scale = (1 - fixed) / free_sum
      for idx = 1, ncols do
        if fracs[idx] > col_min[idx] then
          fracs[idx] = fracs[idx] * scale
        end
      end
    end
  end
  return fracs
end

local function width_expr(frac, ncols)
  return string.format(
    '\\dimexpr%.4f\\linewidth-2\\tabcolsep-%.4f\\arrayrulewidth\\relax',
    frac, (ncols + 1) / ncols
  )
end

local function format_cell_lists(tex, add_topsep)
  if tex:find('^\\begin{itemize}') or tex:find('^\\begin{enumerate}') then
    local opts = add_topsep and '[topsep=6pt,before=\\raggedright]' or '[before=\\raggedright]'
    tex = tex:gsub('^(\\begin{itemize})', '%1' .. opts, 1)
    tex = tex:gsub('^(\\begin{enumerate})', '%1' .. opts, 1)
  elseif tex:find('\\begin{itemize}') or tex:find('\\begin{enumerate}') then
    tex = tex:gsub('(\\begin{itemize})', '%1[before=\\raggedright]')
    tex = tex:gsub('(\\begin{enumerate})', '%1[before=\\raggedright]')
  end
  return tex
end

local function render_cell_top_minipage(cell, col_spec, is_header)
  local tex = pandoc.write(pandoc.Pandoc(cell.contents), 'latex')
  tex = tex:gsub('^%s+', ''):gsub('%s+$', '')
  if tex == '' then
    return ''
  end
  tex = format_cell_lists(tex, false)
  local bot_pad = is_header and '5pt' or '6pt'
  local align_cmd = latex_align_cmd(cell, col_spec)
  return string.format(
    '\\begin{minipage}[t]{\\linewidth}%s%%\n%s\\par\\vspace*{%s}\\kern0pt\\end{minipage}',
    align_cmd, tex, bot_pad
  )
end

local function render_cell_native(cell, col_spec, row_valign, col_valign, width, is_first, is_header)
  local tex = pandoc.write(pandoc.Pandoc(cell.contents), 'latex')
  tex = tex:gsub('^%s+', ''):gsub('%s+$', '')
  tex = format_cell_lists(tex, row_valign ~= 'p')
  local use_multicol = (row_valign ~= col_valign)
    and not tex:find('\\begin{verbatim}')
    and not tex:find('\\begin{Highlighting}')
  if not use_multicol then
    return tex
  end
  local align_cmd = latex_align_cmd(cell, col_spec)
  local prefix = is_first and '|' or ''
  if row_valign == 'p' then
    local inner = render_cell_top_minipage(cell, col_spec, is_header)
    return string.format(
      '\\multicolumn{1}{%sp{%s}|}{%s}',
      prefix, width, inner
    )
  end
  return string.format(
    '\\multicolumn{1}{%s>{%s\\arraybackslash}%s{%s}|}{%s}',
    prefix, align_cmd, row_valign, width, tex
  )
end

local function build_latex_grid(tbl, opts)
  local kind = opts.kind
  local valign = opts.valign or 'p'
  local hvalign = opts.hvalign or valign

  local rows = collect_rows(tbl)
  if #rows == 0 or #tbl.colspecs == 0 then
    return nil
  end
  local ncols = #tbl.colspecs
  if kind == 'matriz-2x2' and (#rows ~= 4 or ncols ~= 2) then
    return nil
  end
  for _, row in ipairs(rows) do
    if #row.cells ~= ncols then
      return nil
    end
  end

  local header_count = #tbl.head.rows
  local fracs = compute_col_fractions(tbl, kind, ncols, rows, header_count)
  local widths = {}
  local col_specs = {}
  local use_longtable = (kind == 'cuadricula')

  for idx = 1, ncols do
    widths[idx] = width_expr(fracs[idx], ncols)
    if valign == 'p' then
      table.insert(col_specs, 'p{' .. widths[idx] .. '}')
    else
      local align_cmd = latex_align_cmd(nil, tbl.colspecs[idx])
      table.insert(col_specs, string.format('>{%s\\arraybackslash}%s{%s}', align_cmd, valign, widths[idx]))
    end
  end

  local lines = {}
  if use_longtable then
    table.insert(lines, '{\\setlength{\\tabcolsep}{8pt}%')
    table.insert(lines, '\\setlength{\\arrayrulewidth}{0.75pt}%')
    table.insert(lines, '\\setlength{\\LTpre}{6pt}%')
    table.insert(lines, '\\setlength{\\LTpost}{6pt}%')
    table.insert(lines, '\\setlength{\\LTleft}{0pt}%')
    table.insert(lines, '\\setlength{\\LTright}{0pt}%')
    table.insert(lines, '\\asitablamatriztrue%')
  else
    table.insert(lines, '\\par\\addvspace{6pt}%')
    table.insert(lines, '{\\setlength{\\tabcolsep}{8pt}%')
    table.insert(lines, '\\setlength{\\arrayrulewidth}{0.75pt}%')
    table.insert(lines, '\\setlength{\\parfillskip}{0pt plus 1fil}%')
  end
  if valign == 'p' then
    table.insert(lines, '\\renewcommand{\\arraystretch}{1.35}%')
  elseif valign == 'm' then
    table.insert(lines, '\\setlength{\\extrarowheight}{-1.5pt}%')
    table.insert(lines, '\\renewcommand{\\arraystretch}{1.55}%')
  else
    table.insert(lines, '\\setlength{\\extrarowheight}{3pt}%')
    table.insert(lines, '\\renewcommand{\\arraystretch}{1.35}%')
  end
  table.insert(lines, '\\arrayrulecolor{barcolor}%')

  local function render_row_block(r_idx, row, out_buf)
    local is_header = (r_idx <= header_count) or (kind == 'matriz-2x2' and r_idx == 3)
    if is_header then
      table.insert(out_buf, '\\rowcolor{fondocolor}%')
    end
    local parts = {}
    local row_valign = is_header and hvalign or valign
    for idx = 1, ncols do
      if row_valign == 'p' and valign == 'p' then
        parts[idx] = render_cell_top_minipage(row.cells[idx], tbl.colspecs[idx], is_header)
      else
        parts[idx] = render_cell_native(
          row.cells[idx], tbl.colspecs[idx], row_valign, valign, widths[idx], idx == 1, is_header
        )
      end
    end
    table.insert(out_buf, table.concat(parts, ' &\n') .. ' \\\\')
    table.insert(out_buf, '\\hline')
  end

  if use_longtable then
    table.insert(lines, '\\begin{longtable}{|' .. table.concat(col_specs, '|') .. '|}')
    if header_count > 0 then
      local head_buf = { '\\hline' }
      for r_idx = 1, header_count do
        render_row_block(r_idx, rows[r_idx], head_buf)
      end
      for _, hline in ipairs(head_buf) do table.insert(lines, hline) end
      table.insert(lines, '\\endfirsthead')
      for _, hline in ipairs(head_buf) do table.insert(lines, hline) end
      table.insert(lines, '\\endhead')
      for r_idx = header_count + 1, #rows do
        render_row_block(r_idx, rows[r_idx], lines)
      end
    else
      table.insert(lines, '\\hline')
      for r_idx, row in ipairs(rows) do
        render_row_block(r_idx, row, lines)
      end
    end
    table.insert(lines, '\\end{longtable}}')
  else
    table.insert(lines, '\\noindent\\begin{tabular}{|' .. table.concat(col_specs, '|') .. '|}')
    table.insert(lines, '\\hline')
    for r_idx, row in ipairs(rows) do
      render_row_block(r_idx, row, lines)
    end
    table.insert(lines, '\\end{tabular}\\par}\\par\\addvspace{6pt}')
  end
  return pandoc.RawBlock('latex', table.concat(lines, '\n'))
end

local function build_latex_booktabs(tbl, opts)
  local valign = opts.valign or 'p'
  local hvalign = opts.hvalign or valign
  local tex = pandoc.write(pandoc.Pandoc({ tbl }), 'latex')

  local coldecl, rest = tex:match('^(\\begin{longtable}%b[]%b{}\r?\n)(.*)$')
  if not coldecl then
    return nil
  end
  if valign ~= 'p' then
    coldecl = coldecl:gsub('([}%s])p(%{)', '%1' .. valign .. '%2')
  end

  local head_all, body_tail = rest:match('^(.-)(\\endlastfoot.*)$')
  if head_all then
    local head_pos = ({ p = 't', m = 'c', b = 'b' })[hvalign] or 'b'
    local body_pos = ({ p = 't', m = 'c', b = 'b' })[valign] or 't'
    head_all = head_all:gsub('(\\begin{minipage})%[[^%]]*%]({\\linewidth})', '%1[' .. head_pos .. ']%2')
    if valign ~= 'p' then
      body_tail = body_tail:gsub('(\\begin{minipage})%[[^%]]*%]({\\linewidth})', '%1[' .. body_pos .. ']%2')
    end
    rest = head_all .. body_tail
  end
  rest = rest:gsub('(\\begin{itemize})', '%1[before=\\raggedright]')
  rest = rest:gsub('(\\begin{enumerate})', '%1[before=\\raggedright]')

  return pandoc.RawBlock('latex', coldecl .. rest)
end

local function apply_epub_classes(tbl, opts)
  if opts.kind ~= 'tabla' then
    tbl.attr.classes:insert(opts.kind)
  end
  if opts.valign then
    tbl.attr.classes:insert('valign-' .. VALIGN_CSS[opts.valign])
  end
  if opts.hvalign then
    tbl.attr.classes:insert('hvalign-' .. VALIGN_CSS[opts.hvalign])
  end
  return tbl
end

function Blocks(blocks)
  local out = pandoc.List()
  local i = 1
  while i <= #blocks do
    local opts = parse_marker(blocks[i])
    local nxt = blocks[i + 1]
    if opts and nxt and nxt.t == 'Table' then
      if FORMAT:match('latex') then
        local latex_tbl
        if opts.kind == 'tabla' then
          latex_tbl = build_latex_booktabs(nxt, opts)
        else
          latex_tbl = build_latex_grid(nxt, opts)
        end
        if latex_tbl then
          out:insert(latex_tbl)
          i = i + 2
          goto continue
        end
      else
        out:insert(apply_epub_classes(nxt, opts))
        i = i + 2
        goto continue
      end
    end
    out:insert(blocks[i])
    i = i + 1
    ::continue::
  end
  return out
end
