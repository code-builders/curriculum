module MoneyHelper

  def money(cents)
    dollars = cents.to_f / 100
    result = "<span class='dollar-symbol'>$</span>"
    result += "<span class='dollar-amount'>#{dollars.to_i}</span>"
    result += "<span class='dollar-decimal'>.#{cents - (dollars.to_i * 100)}</span>"
    result.html_safe
  end

end
