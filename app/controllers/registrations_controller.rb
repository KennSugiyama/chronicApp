class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

 def create
  p params
  p '*' *50
      super
      #Send email to the user when sign up
      UserMailer.welcome_email(@user).deliver
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:user, keys: [:username])
  end

end
