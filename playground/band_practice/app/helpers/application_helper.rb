module ApplicationHelper

  def gravatar_for(email)
    hashed_email = Digest::MD5.hexdigest(email.downcase.strip)
    image_tag "http://www.gravatar.com/avatar/#{hashed_email}.jpg"
  end

end
