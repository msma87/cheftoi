class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # ... outros métodos ...
  def index
    @services = Service.all # Isso garante que @services será uma coleção, mesmo que vazia
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
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :category, :price, :description) # Atualize com todos os campos permitidos
  end
end
