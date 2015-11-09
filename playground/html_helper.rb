class HtmlHelper


  def link_to(text, path)
    s = ""
    s += "<a href='"
    s += path
    s += "'>"
    s += text
    s += "</a>"
    s
  end

  def image_tag(filename)
    "<img src='/assets/#{filename}' />"
  end

  def list_tag(items)
    # ["Cheese", "Olives", "Onions"]
    result = "<ul>"
    items.each do |item|
      result += "<li>#{item}</li>"
    end
    result += "</ul>"
    result
  end

end
