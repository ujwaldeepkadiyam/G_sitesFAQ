function Header(el)
  if el.level == 1 then  -- If your LaTeX \section{} becomes <h2> in HTML, change this to 2
    local back = pandoc.RawBlock(
      "html",
      '<div class="back-to-toc"><a href="#TOC">↑ Back to Contents</a></div>'
    )
    return {el, back}
  end
  return el
end
