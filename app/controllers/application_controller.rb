class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name])
  end

  def authenticate_inviter!
    if current_user.try(:admin?)
      current_user
    else
      raise NotAllowedToInviteUsers
    end
  rescue NotAllowedToInviteUsers => e
    redirect_to root_path, notice: 'You cannot add users.'
  end

  class NotAllowedToInviteUsers < StandardError
  end
end
