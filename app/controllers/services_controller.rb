class ServicesController < ApplicationController
  before_action :set_service, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]

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

  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  private

  def service_params
    params.require(:service).permit(:title, :category, :price)
  end

  def set_service
    @service = Service.find(params[:id])
  end
end
