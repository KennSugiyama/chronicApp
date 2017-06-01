class UserMailer < ApplicationMailer
default from: 'crabbyreviews@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'user_session_path'
    mail(to: @user.email, subject: 'Welcome to Crabby Reviews!')
  end
end
