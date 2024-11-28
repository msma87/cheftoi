class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :verify_service_owner, only: [:edit, :update, :destroy]

  def index
    if params[:category].present?
      # Busca serviços pela categoria (case-insensitive)
      @services = Service.where("LOWER(category) LIKE ?", "%#{params[:category].downcase}%")
    else
      # Mostra todos os serviços caso não haja busca
      @services = Service.all
    end
  end

  def show
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
      redirect_to service_path(@service), notice: 'Serviço criado com sucesso.'
    else
      flash.now[:alert] = 'Por favor, preencha todos os campos obrigatórios.'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # view de edit será renderizada automaticamente
  end

  def update
    if @service.update(service_params)
      redirect_to service_path(@service), notice: 'Serviço atualizado com sucesso.'
    else
      flash.now[:alert] = 'Por favor, preencha todos os campos obrigatórios.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # Verifica se o usuário atual é o proprietário do serviço
    if @service.user == current_user
      if @service.destroy
        # Recupera a "página anterior anterior" do histórico de navegação
        previous_previous_page = session[:navigation_history]&.dig(-3)

        if previous_previous_page
          redirect_to previous_previous_page, notice: 'Serviço deletado com sucesso.'
        else
          redirect_to services_path, notice: 'Serviço deletado com sucesso, mas não foi possível determinar a página anterior.'
        end
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

  def verify_service_owner
    unless @service.owned_by?(current_user)
      redirect_to services_path, alert: 'Você não tem permissão para editar este serviço.'
    end
  end

  def service_params
    params.require(:service).permit(:title, :category, :price, :description, :photo) # Atualize com todos os campos permitidos
  end
end
