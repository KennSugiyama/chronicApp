class RegistrationsController < Devise::RegistrationsController
    
 def create
      super
      #Send email to the user when sign up
      UserMailer.welcome_email(@user).deliver
  end

end