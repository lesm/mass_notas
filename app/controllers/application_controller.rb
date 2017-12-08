class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def usuario_actual
    @usuario_actual ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end
  helper_method :usuario_actual

  private

  def authenticate!
    redirect_to login_path, alert: 'No estás autorizado para acceder a esta página' unless usuario_actual
  end
end
