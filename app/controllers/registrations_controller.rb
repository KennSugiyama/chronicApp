class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

 def create
      super
      #Send email to the user when sign up
      UserMailer.welcome_email(@user).deliver
      @user.username = @user.email[/\w+@[a-zA-Z_]/][0..-3]
      @user.save
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:user, keys: [:username])
  end
end
