class ApplicationController < ActionController::Base
  # Redireciona para o dashboard após o login
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path  # Redireciona para o dashboard do admin
    else
      user_dashboard_path  # Redireciona para o dashboard do usuário
    end
  end
end
