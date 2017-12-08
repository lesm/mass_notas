class UsuariosController < ApplicationController
  layout 'login'

  def login
  end

  def authenticate
    usuario = Usuario.find_by_username(params[:usuario][:username])
    if usuario && usuario.authenticate(params[:usuario][:password])
      session[:usuario_id] = usuario.id
      redirect_to root_path
    else
      flash[:error] = 'Usuario o contraseña no válidos'
      redirect_to login_path
    end
  end

  def logout
    session[:usuario_id] = nil
    redirect_to login_path
  end
end
