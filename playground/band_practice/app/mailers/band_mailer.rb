class BandMailer < ApplicationMailer

  def subscribe(user_id)
    @user = User.find(user_id)
    # to:, from:, subject:, cc:, bcc:, body:
    mail(to: @user.email, subject: "Congrats on subscribing!")
  end

end
