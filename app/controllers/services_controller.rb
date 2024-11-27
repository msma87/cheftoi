class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @services = Service.all
  end

  def my
    @services = Service.where(user: current_user)
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user

    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def destroy
    if @service.user == current_user # Adiciona verificação de proprietário
      if @service.destroy
        redirect_to services_path, notice: 'Serviço deletado com sucesso.'
      else
        redirect_to service_path(@service), alert: 'Não foi possível deletar o serviço.'
      end
    else
      redirect_to service_path(@service), alert: 'Você não tem permissão para deletar este serviço.'
    end
  end

  private

  def set_service
    @service = Service.find_by(id: params[:id])
    redirect_to services_path, alert: 'Service not found' if @service.nil?
  end

  def service_params
    params.require(:service).permit(:title, :category, :price, :description, :photo) # Atualize com todos os campos permitidos
  end
end
