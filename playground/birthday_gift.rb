class BirthdayGift

  def shake_box
    if look_in_box == "Rubby Ducky"
      "squeak thud"
    else
      "rattle"
    end
  end

  def look_in_box # read_file
    "Rubby Ducky"
  end
  private :look_in_box

end
