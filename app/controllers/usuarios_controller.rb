class UsuariosController < ApplicationController
  def login
  end

  def authenticate
    usuario = Usuario.find_by_username(params[:usuario][:username])
    if usuario && usuario.authenticate(params[:usuario][:password])
      session[:usuario_id] = usuario.id
      redirect_to root_path
    else
      flash.now[:error] = 'Usuario o contraseña no válidos'
      render :login
    end
  end

end
