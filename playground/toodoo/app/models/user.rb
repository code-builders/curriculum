class User < ActiveRecord::Base
  has_secure_password
  # validates :password == :password_confirmation for new users
  # attr_accessor :password, :password_confirmation

  # def authenticate(pwd)
    # BCrypt::Password.new(password_digest) == pwd
  # end
end
