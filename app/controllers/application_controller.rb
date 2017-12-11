class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  # CanCan - Redirection après accès refusé
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/users/sign_in', :alert => exception.message
  end

  # Devise - Redirection après connexion
  def after_sign_out_path_for(resource_or_scope)
    '/users/sign_in'
  end

  # Devise - Redirection après déconnexion
  def after_sign_out_path_for(resource_or_scope)
      '/'
  end

end
