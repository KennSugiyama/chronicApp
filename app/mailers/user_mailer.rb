class UserMailer < ApplicationMailer
	default from: 'crabbyreviews@gmail.com'
 
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Crabby Reviews!')
  end
end
