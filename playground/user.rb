class User
  attr_accessor :username

  def initialize(attrs)
    @username              = attrs[:username]
    @password              = attrs[:password]
    @password_confirmation = attrs[:password_confirmation]
  end

  def valid?
    if @password == @password_confirmation
      true
    else
      false
    end
  end

  def authenticate(pwd)
    if pwd == @password
      true
    else
      false
    end
  end

end
