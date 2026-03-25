class FlightsController < ApplicationController
  def index
    @airports = Airport.all.order(:code)

  @available_dates = Flight
    .pluck(:departure_time)
    .map { |dt| dt.to_date }
    .uniq
    .sort

    # Basic search params: departure_airport_id, arrival_airport_id, date
    @flights = Flight.all

    if params[:departure_airport_id].present?
      @flights = @flights.where(departure_airport_id: params[:departure_airport_id])
    end

    if params[:arrival_airport_id].present?
      @flights = @flights.where(arrival_airport_id: params[:arrival_airport_id])
    end

    if params[:date].present?
      date = Date.parse(params[:date]) rescue nil
      @flights = @flights.where(departure_time: date.beginning_of_day..date.end_of_day) if date
    end
  end
end
