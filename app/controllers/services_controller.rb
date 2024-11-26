# app/controllers/services_controller.rb - Máira
class ServicesController < ApplicationController
  before_action :set_service, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title)
  end
end
