class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @passenger_count = params[:passengers].to_i
    @booking = @flight.bookings.build

    # Build blank passenger objects
    @passenger_count.times { @booking.passengers.build }
    Rails.logger.debug "DEBUG → passengers param: #{params[:passengers].inspect}, count: #{@passenger_count}, Passengers built: #{@booking.passengers.size}"
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to root_path, notice: "Booking successfully created!"
    else
      @flight = @booking.flight
      @passenger_count = @booking.passengers.size
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(
      :flight_id,
      passengers_attributes: [ :name, :email ]
    )
  end
end
