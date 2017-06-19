class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role, :phone])
  end

  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end

end
