-- Adattamenti di presentazione per la stampa, senza riscrivere le fonti HTML.
-- Esecuzione pre-ast: i callout sono ancora Div Pandoc, prima dei box LaTeX.
if not FORMAT:match("latex") then
  return {}
end

local function clean_str(el)
  el.text = el.text:gsub("🎯", ""):gsub("▶", "")
    :gsub("⚠️", "Attenzione:"):gsub("⚠", "Attenzione:")
    :gsub("❝", "“"):gsub("️", "")
  return el
end

-- Il link di fine capitolo alla pagina della bibliografia diventa, nel PDF,
-- un rimando interno all'elenco dei riferimenti.
local function printed_link(link)
  if link.target:match("bibliografia%.qmd$") then
    link.target = "#refs"
    return link
  end
end

local function printed_inlines(inlines)
  local result, pending, target = pandoc.Inlines({}), nil, nil
  for _, el in ipairs(inlines) do
    if el.t == "RawInline" and el.format == "html" then
      local href = el.text:match('<a%s[^>]-href="([^"]+)"')
      if href then
        target, pending = href, pandoc.Inlines({})
      elseif el.text:match("^</a>") and pending then
        result:insert(pandoc.Link(pending, target))
        pending, target = nil, nil
      elseif el.text:match("^<br%s*/?>") and #result > 0 then
        result:insert(pandoc.LineBreak())
      else
        (pending or result):insert(el)
      end
    else
      (pending or result):insert(el)
    end
  end
  if pending then
    result:extend(pending)
  end
  return result
end

local function open_callout(div)
  local is_callout = false
  for _, class in ipairs(div.classes) do
    if class:match("^callout") then is_callout = true end
  end
  if not is_callout then return nil end
  local has_table = false
  div:walk({Table = function() has_table = true end})
  if has_table or div.attributes.collapse == "true"
      or #pandoc.utils.stringify(div.content) > 1800 then
    -- Un box lungo o contenente longtable ostacola la paginazione.
    -- Il titolo resta visibile e solidale con l'inizio del contenuto.
    if div.content[1] and div.content[1].t == "Header" then
      local heading = div.content[1]
      heading.classes:insert("unnumbered")
      heading.classes:insert("unlisted")
    end
    return div.content
  end
end

local function printed_blocks(blocks)
  local out, summary = pandoc.Blocks({}), nil
  for i, block in ipairs(blocks) do
    if block.t == "RawBlock" and block.format == "html"
        and block.text:match("^<summary>") then
      summary = pandoc.Inlines({})
    elseif summary and block.t == "RawBlock" and block.text:match("^</summary>") then
      out:insert(pandoc.Header(2, summary, pandoc.Attr("", {"unnumbered", "unlisted"})))
      summary = nil
    elseif summary then
      if block.t == "Plain" or block.t == "Para" then summary:extend(block.content) end
    elseif block.t == "Header" and block.level > 1
        and pandoc.utils.stringify(block.content):lower() == "riferimenti bibliografici"
        and (not blocks[i + 1] or blocks[i + 1].t == "Header") then
      -- Titolo locale senza contenuto: la bibliografia unica è in #refs.
    else
      out:insert(block)
    end
  end
  return out
end

local function readable_table(tbl)
  local has_image = false
  tbl = tbl:walk({Image = function(img)
    has_image = true
    -- Le percentuali sono relative alla cella, non alla pagina.
    if (img.attributes.width or ""):match("%%$") then
      img.attributes.width = "100%"
    end
    return img
  end})
  if has_image and #tbl.colspecs == 2 then
    tbl.colspecs[1][2] = 0.35
    tbl.colspecs[2][2] = 0.65
  end
  return tbl
end

-- Parti «Strumenti» (capitoli tecnici): colori verdi e unghiatura, vedi
-- pdf-layout.tex. In questa fase le parti sono Div .quarto-book-part e i
-- capitoli intestazioni di primo livello. Il verde si accende prima di una
-- parte il cui titolo comincia con «Strumenti» e si spegne alla parte
-- successiva, o al primo capitolo che non si apre con il riquadro
-- .inserto-strumenti (per esempio la bibliografia).
local function apre_capitolo_tecnico(blocks, i)
  for j = i + 1, math.min(i + 6, #blocks) do
    local b = blocks[j]
    if b.t == "Header" and b.level == 1 then return false end
    if b.t == "Div" and b.classes:includes("quarto-book-part") then return false end
    if b.t == "Div" and b.classes:includes("inserto-strumenti") then return true end
  end
  return false
end

-- Nel PDF i link fra capitoli (../parte/capitolo.qmd) diventerebbero link a
-- file inesistenti: li si trasforma in rimandi interni. I capitoli arrivano
-- nell'ordine di _quarto-libro.yml, dopo l'introduzione (index.qmd).
local function capitoli_del_libro()
  local slugs = {}
  local f = io.open("_quarto-libro.yml", "r")
  if not f then return slugs end
  for line in f:lines() do
    local slug = line:match("^%s*%-%s*[%w%-/]*/([%w%-]+)%.qmd%s*$")
    if slug and slug ~= "index" and slug ~= "bibliografia" then table.insert(slugs, slug) end
  end
  f:close()
  return slugs
end

function collega_capitoli(doc)
  local slugs, ids, k = capitoli_del_libro(), {}, 0
  local visto_intro = false
  for _, b in ipairs(doc.blocks) do
    if b.t == "Header" and b.level == 1 then
      if not visto_intro then
        visto_intro = true
      else
        k = k + 1
        if slugs[k] then
          if b.identifier == "" then b.identifier = "cap-" .. slugs[k] end
          ids[slugs[k]] = b.identifier
        end
      end
    end
  end
  return doc:walk({Link = function(l)
    -- Le pagine solo del sito (professione, divulgazione) puntano al sito.
    local pagina = l.target:match("((%a+)%-pagine/[%w%-]+)%.qmd$")
    if pagina then
      l.target = "https://enricotoffalini.github.io/psicologia-intelligenza/" .. pagina .. ".html"
      return l
    end
    local slug, ancora = l.target:match("([%w%-]+)%.qmd(#?[%w%-]*)$")
    if slug and slug ~= "bibliografia" then
      if ancora ~= "" then l.target = ancora
      elseif ids[slug] then l.target = "#" .. ids[slug] end
      return l
    end
  end})
end

local function strumenti_parti(doc)
  local out, attivo = pandoc.Blocks({}), false
  for i, b in ipairs(doc.blocks) do
    if b.t == "Div" and b.classes:includes("quarto-book-part") then
      if pandoc.utils.stringify(b.content):match("^%s*Strumenti") then
        out:insert(pandoc.RawBlock("latex", "\\strumentiinizio"))
        attivo = true
      elseif attivo then
        out:insert(pandoc.RawBlock("latex", "\\strumentifine"))
        attivo = false
      end
    elseif attivo and b.t == "Header" and b.level == 1 and not apre_capitolo_tecnico(doc.blocks, i) then
      out:insert(pandoc.RawBlock("latex", "\\strumentifine"))
      attivo = false
    end
    out:insert(b)
  end
  doc.blocks = out
  return collega_capitoli(doc)
end

-- Riquadri verdi: apertura dei capitoli tecnici e rimandi dai capitoli concettuali.
local function strumenti_div(div)
  for _, class in ipairs(div.classes) do
    if class == "inserto-strumenti" or class == "rimando-strumenti" then
      local env = class == "inserto-strumenti" and "insertostrumenti" or "rimandostrumenti"
      local out = pandoc.Blocks({pandoc.RawBlock("latex", "\\begin{" .. env .. "}")})
      out:extend(div.content)
      out:insert(pandoc.RawBlock("latex", "\\end{" .. env .. "}"))
      return out
    end
  end
end

return {{Pandoc = strumenti_parti}, {Link = printed_link, Div = strumenti_div}, {Str = clean_str, Inlines = printed_inlines, Div = open_callout,
         Blocks = printed_blocks, Table = readable_table}}
