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

local function compute_col_fractions(tbl, kind, ncols)
  local fracs = {}
  local sum_w = 0
  local has_all_widths = true
  for idx = 1, ncols do
    local w = tbl.colspecs[idx][2]
    if w and w > 0 then
      sum_w = sum_w + w
    else
      has_all_widths = false
    end
  end
  for idx = 1, ncols do
    local w = tbl.colspecs[idx][2]
    if kind == 'matriz-2x2' then
      fracs[idx] = 0.5
    elseif has_all_widths and sum_w > 0 then
      fracs[idx] = w / sum_w
    else
      fracs[idx] = 1 / ncols
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

local function render_cell_top_minipage(cell, col_spec, is_header)
  local tex = pandoc.write(pandoc.Pandoc(cell.contents), 'latex')
  tex = tex:gsub('^%s+', ''):gsub('%s+$', '')
  if tex == '' then
    return ''
  end
  local top_pad = is_header and '1pt' or '0pt'
  local bot_pad = is_header and '4pt' or '6pt'
  local align_cmd = latex_align_cmd(cell, col_spec)
  return string.format(
    '\\begin{minipage}[t]{\\linewidth}%s\\vspace*{%s}%%\n%s\\par\\vspace*{%s}\\kern0pt\\end{minipage}',
    align_cmd, top_pad, tex, bot_pad
  )
end

local function render_cell_native(cell, col_spec, row_valign, col_valign, width, is_first, is_header)
  local tex = pandoc.write(pandoc.Pandoc(cell.contents), 'latex')
  tex = tex:gsub('^%s+', ''):gsub('%s+$', '')
  if tex:find('^\\begin{itemize}') or tex:find('^\\begin{enumerate}') then
    tex = tex:gsub('^(\\begin{itemize})', '%1[topsep=6pt,before=\\raggedright]', 1)
    tex = tex:gsub('^(\\begin{enumerate})', '%1[topsep=6pt,before=\\raggedright]', 1)
  elseif tex:find('\\begin{itemize}') or tex:find('\\begin{enumerate}') then
    tex = tex:gsub('(\\begin{itemize})', '%1[before=\\raggedright]')
    tex = tex:gsub('(\\begin{enumerate})', '%1[before=\\raggedright]')
  end
  local use_multicol = (row_valign ~= col_valign)
    and not tex:find('\\begin{verbatim}')
    and not tex:find('\\begin{Highlighting}')
  if not use_multicol then
    return tex
  end
  local align_cmd = latex_align_cmd(cell, col_spec)
  local prefix = is_first and '|' or ''
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

  local fracs = compute_col_fractions(tbl, kind, ncols)
  local widths = {}
  local col_specs = {}

  for idx = 1, ncols do
    widths[idx] = width_expr(fracs[idx], ncols)
    if valign == 'p' then
      table.insert(col_specs, 'p{' .. widths[idx] .. '}')
    else
      local align_cmd = latex_align_cmd(nil, tbl.colspecs[idx])
      table.insert(col_specs, string.format('>{%s\\arraybackslash}%s{%s}', align_cmd, valign, widths[idx]))
    end
  end

  local lines = {
    '\\par\\addvspace{6pt}%',
    '{\\setlength{\\tabcolsep}{8pt}%',
    '\\setlength{\\arrayrulewidth}{0.75pt}%',
  }
  if valign == 'p' and hvalign == 'p' then
    table.insert(lines, '\\renewcommand{\\arraystretch}{1.2}%')
  elseif valign == 'm' then
    table.insert(lines, '\\setlength{\\extrarowheight}{-1.5pt}%')
    table.insert(lines, '\\renewcommand{\\arraystretch}{1.55}%')
  else
    table.insert(lines, '\\setlength{\\extrarowheight}{3pt}%')
    table.insert(lines, '\\renewcommand{\\arraystretch}{1.35}%')
  end
  table.insert(lines, '\\arrayrulecolor{barcolor}%')
  table.insert(lines, '\\noindent\\begin{tabular}{|' .. table.concat(col_specs, '|') .. '|}')
  table.insert(lines, '\\hline')

  local header_count = #tbl.head.rows
  for r_idx, row in ipairs(rows) do
    local is_header = (r_idx <= header_count) or (kind == 'matriz-2x2' and r_idx == 3)
    if is_header then
      table.insert(lines, '\\rowcolor{fondocolor}%')
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
    table.insert(lines, table.concat(parts, ' &\n') .. ' \\\\')
    table.insert(lines, '\\hline')
  end

  table.insert(lines, '\\end{tabular}}\\par\\addvspace{6pt}')
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
    local minipage_pos = ({ p = 't', m = 'c', b = 'b' })[hvalign] or 'b'
    head_all = head_all:gsub('(\\begin{minipage})%[[^%]]*%]({\\linewidth})', '%1[' .. minipage_pos .. ']%2')
    rest = head_all .. body_tail
  end

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
