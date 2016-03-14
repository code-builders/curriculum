class Talk

  def politely_say
    puts "Ahem..."
    puts yield
    puts "That's all. Thanks."
  end

end
