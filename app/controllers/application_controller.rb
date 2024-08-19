class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Redireciona para o dashboard após o login
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path  # Redireciona para o dashboard do admin
    else
      user_dashboard_path  # Redireciona para o dashboard do usuário
    end
  end

  protected

  # Permite o campo nome durante o cadastro e a atualização da conta
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome])
  end
end
