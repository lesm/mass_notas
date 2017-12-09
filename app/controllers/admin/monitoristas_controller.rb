class Admin::MonitoristasController < ApplicationController
  before_action :set_monitorista, only: [:show, :edit, :update, :destroy]

  layout "layouts/admin"

  def index
    @monitoristas = Monitorista.order(created_at: :desc)
  end

  def new
    @monitorista = Monitorista.new
  end

  def show
  end

  def edit
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
    respond_to do |format|
      if @monitorista.update(monitorista_params)
        format.html { redirect_to admin_monitorista_path(@monitorista), notice: 'El monitorista se actualizo correctamente' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @monitorista.destroy
        format.html { redirect_to admin_monitoristas_path, notice: 'El monitorista fue eliminado correctamente' }
      end
    end
  end

  private

  def set_monitorista
    @monitorista = Monitorista.find(params[:id])
  end

  def monitorista_params
    params.require(:monitorista).permit(:nombre, :username, :email, :password, :password_confirmation, :telefono)
  end
end
