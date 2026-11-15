-- ==============================================================================
-- tablas-matriz.lua — Filtro de pandoc: matrices 2x2 de 4 cuadrantes y tablas
--                     con cuadrícula completa (PDF/LuaLaTeX y EPUB/HTML).
--
-- EL PROBLEMA
--   Por defecto, pandoc compila todas las tablas en LaTeX con booktabs
--   (\toprule, \midrule solo tras la fila 1, \bottomrule), sin líneas
--   verticales ni divisiones entre filas del cuerpo. En matrices 2x2 (como la
--   Matriz de McFarlan), los cuadrantes inferiores quedan visualmente sueltos.
--
-- CÓMO SE USA
--   Colocar un comentario HTML invisible justo antes de una tabla Markdown GFM:
--     - <!-- matriz-2x2 --> : Tabla de 2 columnas x 4 filas donde las filas 1 y 3
--                             son títulos de cuadrantes y las filas 2 y 4 su
--                             contenido (4 cuadrados con bordes y encabezados).
--     - <!-- cuadricula --> : Cualquier tabla NxM con bordes completos en todas
--                             sus celdas y encabezado sombreado.
--
--   Debe cargarse DESPUÉS de tablas-listas.lua en pdf.yaml y epub.yaml para que
--   las viñetas "•" ya estén convertidas en listas nativas.
-- ==============================================================================

local function get_marker_kind(block)
  if not block or block.t ~= 'RawBlock' or block.format ~= 'html' then
    return nil
  end
  if block.text:match('^%s*<!%-%-%s*matriz%-2x2%s*%-%->%s*$') then
    return 'matriz-2x2'
  elseif block.text:match('^%s*<!%-%-%s*cuadricula%s*%-%->%s*$') then
    return 'cuadricula'
  end
  return nil
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

local function render_cell_latex(cell, is_header)
  local tex = pandoc.write(pandoc.Pandoc(cell.contents), 'latex')
  tex = tex:gsub('^%s+', ''):gsub('%s+$', '')
  if tex == '' then
    return ''
  end
  local top_pad = is_header and '1pt' or '0pt'
  local bot_pad = is_header and '4pt' or '6pt'
  return string.format(
    '\\begin{minipage}[t]{\\linewidth}\\raggedright\\vspace*{%s}%%\n%s\\par\\vspace*{%s}\\kern0pt\\end{minipage}',
    top_pad, tex, bot_pad
  )
end

local function render_row_latex(row, ncols, is_header)
  local parts = {}
  for idx = 1, ncols do
    parts[idx] = render_cell_latex(row.cells[idx], is_header)
  end
  return table.concat(parts, ' &\n') .. ' \\\\'
end

local function build_latex_grid(tbl, kind)
  local rows = collect_rows(tbl)
  if #rows == 0 or #tbl.colspecs == 0 then
    return nil
  end
  local ncols = #tbl.colspecs
  if kind == 'matriz-2x2' and (#rows ~= 4 or ncols ~= 2) then
    return nil
  end

  local col_specs = {}
  local sum_w = 0
  for idx = 1, ncols do
    local w = tbl.colspecs[idx][2]
    if w and w > 0 then
      sum_w = sum_w + w
    end
  end
  for idx = 1, ncols do
    local w = tbl.colspecs[idx][2]
    local frac
    if kind == 'matriz-2x2' then
      frac = 0.5
    elseif sum_w > 0 and w and w > 0 then
      frac = w / sum_w
    else
      frac = 1 / ncols
    end
    local col = string.format(
      'p{\\dimexpr%.4f\\linewidth-2\\tabcolsep-%.4f\\arrayrulewidth\\relax}',
      frac, (ncols + 1) / ncols
    )
    table.insert(col_specs, col)
  end

  local lines = {
    '\\par\\addvspace{6pt}%',
    '{\\setlength{\\tabcolsep}{8pt}%',
    '\\setlength{\\arrayrulewidth}{0.75pt}%',
    '\\renewcommand{\\arraystretch}{1.2}%',
    '\\arrayrulecolor{barcolor}%',
    '\\noindent\\begin{tabular}{|' .. table.concat(col_specs, '|') .. '|}',
    '\\hline'
  }

  local header_count = #tbl.head.rows
  for _, row in ipairs(rows) do
    if #row.cells ~= ncols then
      return nil
    end
  end
  for r_idx, row in ipairs(rows) do
    local is_header = (r_idx <= header_count) or (kind == 'matriz-2x2' and r_idx == 3)
    if is_header then
      table.insert(lines, '\\rowcolor{fondocolor}%')
    end
    table.insert(lines, render_row_latex(row, ncols, is_header))
    table.insert(lines, '\\hline')
  end

  table.insert(lines, '\\end{tabular}}\\par\\addvspace{6pt}')
  return pandoc.RawBlock('latex', table.concat(lines, '\n'))
end

function Blocks(blocks)
  local out = pandoc.List()
  local i = 1
  while i <= #blocks do
    local kind = get_marker_kind(blocks[i])
    local nxt = blocks[i + 1]
    if kind and nxt and nxt.t == 'Table' then
      if FORMAT:match('latex') then
        local latex_tbl = build_latex_grid(nxt, kind)
        if latex_tbl then
          out:insert(latex_tbl)
          i = i + 2
          goto continue
        end
      else
        nxt.attr.classes:insert(kind)
        out:insert(nxt)
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
