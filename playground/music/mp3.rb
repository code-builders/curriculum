class Mp3 < Music

  def downloadable?
    true
  end

  def needs_to_be_shipped?
    false
  end
  
end
