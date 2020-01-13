require 'rails_helper'

RSpec.describe "Flight show page" do
  before :each do
    @airline = Airline.create!(name: "United")
    @flight = Flight.create!(number: 12345, date: Date.new, time: Time.now, departure_city: "Denver", arrival_city: "Anchorage", airline: @airline)

    @passenger_1 = Passenger.create!(name: "Jomah", age: 31)
    FlightPassenger.create!(passenger: @passenger_1, flight: @flight)
    @passenger_2 = Passenger.create!(name: "Madelyn", age: 28)
    FlightPassenger.create!(passenger: @passenger_2, flight: @flight)
  end

  it "shows the flight information" do
    visit "/flights/#{@flight.id}"

    expect(page).to have_content @flight.number
    expect(page).to have_content @flight.date
    expect(page).to have_content @flight.departure_city
    expect(page).to have_content @flight.arrival_city

    expect(page).to have_content @airline.name

    expect(page).to have_content @passenger_1.name
    expect(page).to have_content @passenger_2.name
  end
end