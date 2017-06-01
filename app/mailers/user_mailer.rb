class UserMailer < ApplicationMailer
default from: 'notifications@crabbyreviews.com'
 
  def welcome(user)
    @user = user
    @url  = 'user_session_path'
    mail(to: @user.email, subject: 'Welcome to Crabby Reviews!')
  end
end
