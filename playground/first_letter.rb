class FirstLetter

  def  initialize(h)
    @hash = h
  end

  def key_with_letter(l)
    match = @hash.keys.find {|key| key.to_s[0] == l }
    @hash[match]
  end

end
