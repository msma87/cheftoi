class BookingsController < ApplicationController
  before_action :set_service
  before_action :set_booking, only: [:show]
  before_action :authenticate_user! # Isso requer que você esteja usando Devise

  def new
    @booking = @service.bookings.build
  end

  def create
    @booking = @service.bookings.build(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to service_booking_path(@service, @booking), notice: "Reserva realizada com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # Você pode adicionar uma verificação de segurança básica aqui
    unless @booking.user == current_user
      redirect_to root_path, alert: "Você não tem permissão para ver esta reserva."
      return
    end
  end

  def destroy
    @service = Service.find(params[:service_id])
    @booking = @service.bookings.find(params[:id])

    if @booking.destroy
      redirect_to services_path, notice: "Reserva cancelada com sucesso!"
    else
      redirect_to service_booking_path(@service, @booking), alert: "Não foi possível cancelar a reserva."
    end
  end

  private

  def set_service
    @service = Service.find(params[:service_id])
  end

  def set_booking
    @booking = @service.bookings.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Reserva não encontrada ou não pertence a este serviço."
  end

  def booking_params
    params.require(:booking).permit(:date)
  end
end
