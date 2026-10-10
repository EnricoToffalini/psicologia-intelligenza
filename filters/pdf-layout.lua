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

return {{Str = clean_str, Inlines = printed_inlines, Div = open_callout,
         Blocks = printed_blocks, Table = readable_table}}
