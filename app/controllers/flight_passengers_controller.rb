class FlightPassengersController < ApplicationController
  def create
    passenger = Passenger.find(params[:passenger_id])
    flight = Flight.find_by(number: params[:flight_number])
    FlightPassenger.create(passenger: passenger, flight: flight)
    redirect_to "/passengers/#{passenger.id}"
  end
end