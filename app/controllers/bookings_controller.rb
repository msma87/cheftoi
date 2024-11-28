class BookingsController < ApplicationController
  before_action :set_service

  # Exibe o formulário de nova reserva
  def new
    @booking = @service.bookings.build
  end

  # Cria uma nova reserva
  def create
    @booking = @service.bookings.build(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to service_booking_path(@service, @booking), notice: "Reserva realizada com sucesso!"
    else
      flash.now[:alert] = "Não foi possível realizar a reserva. Verifique os erros."
      render :new, status: :unprocessable_entity
    end
  end

  # Exibe a página de confirmação da reserva
  def show
    @booking = Booking.find(params[:id])
  end

  private

  def set_service
    @service = Service.find(params[:service_id])
  end

  def booking_params
    params.require(:booking).permit(:date)
  end
end
