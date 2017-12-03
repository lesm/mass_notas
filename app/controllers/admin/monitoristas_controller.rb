class Admin::MonitoristasController < ApplicationController
  layout "layouts/admin"
  def index
  end

  def new
    @monitorista = Monitorista.new
  end

  def edit
    @monitorista = Monitorista.find_by_id(params[:id])
  end

  def create
    @monitorista = Monitorista.new monitorista_params
    respond_to do |format|
      if @monitorista.save
        format.html { redirect_to admin_monitoristas_path, notice: 'El monitorista se creo correctamente' }
      else
        format.html { render :new }
      end
    end
  end

  def update
  end

  def destroy
  end

  private

  def monitorista_params
    params.require(:monitorista).permit(:nombre, :username, :email, :password, :password_confirmation, :telefono)
  end
end
