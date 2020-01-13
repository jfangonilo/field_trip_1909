require 'rails_helper'

RSpec.describe "Passenger show page" do
  before :each do
    @airline = Airline.create!(name: "United")
    @passenger = Passenger.create!(name: "Jomah", age: 31)

    @flight_1 = Flight.create!(number: 12345, date: Date.new, time: Time.now, departure_city: "Denver", arrival_city: "Anchorage", airline: @airline)
    @flight_2 = Flight.create!(number: 54321, date: Date.new, time: Time.now, departure_city: "Las Vegas", arrival_city: "Denver", airline: @airline)
    FlightPassenger.create!(passenger: @passenger, flight: @flight_1)
    FlightPassenger.create!(passenger: @passenger, flight: @flight_2)
  end

  it "show the passenger name and flight numbers as links" do
    visit "/passengers/#{@passenger.id}"

    expect(page).to have_content @passenger.name
    expect(page).to have_link @flight_1.number
    expect(page).to have_link @flight_2.number

    click_link @flight_1.number
    expect(current_path).to eq("/flights/#{@flight_1.id}")
  end

  it "has a form to add a flight" do
    new_flight = Flight.create!(number: "AS-19041", date: Date.new, time: Time.now, departure_city: "Gunnison", arrival_city: "Florida", airline: @airline)

    visit "/passengers/#{@passenger.id}"
    fill_in "Flight number", with: new_flight.number
    click_button "Add Flight"

    expect(current_path).to eq "/passengers/#{@passenger.id}"
    expect(page).to have_link new_flight.number
  end
end