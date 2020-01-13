require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'validations' do
    it {should validate_presence_of :number}
    it {should validate_uniqueness_of :number}
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
    it {should validate_presence_of :departure_city}
    it {should validate_presence_of :arrival_city}
  end
  describe 'relationships' do
    it {should belong_to :airline}
    it {should have_many(:flight_passengers)}
    it {should have_many(:passengers).through(:flight_passengers)}
  end

  describe "instance methods" do
    before :each do
      @airline = Airline.create!(name: "United")
      @flight = Flight.create!(number: 12345, date: Date.new, time: Time.now, departure_city: "Denver", arrival_city: "Anchorage", airline: @airline)

      @passenger_1 = Passenger.create!(name: "Jomah", age: 31)
      FlightPassenger.create!(passenger: @passenger_1, flight: @flight)
      @passenger_2 = Passenger.create!(name: "Madelyn", age: 28)
      FlightPassenger.create!(passenger: @passenger_2, flight: @flight)
      @passenger_3 = Passenger.create!(name: "Wren", age: 33)
      FlightPassenger.create!(passenger: @passenger_3, flight: @flight)

      @passenger_4 = Passenger.create!(name: "Youngling 1", age: 13)
      FlightPassenger.create!(passenger: @passenger_4, flight: @flight)
      @passenger_5 = Passenger.create!(name: "Youngling 2", age: 8)
      FlightPassenger.create!(passenger: @passenger_5, flight: @flight)

      @passenger_6 = Passenger.create!(name: "Eighteen y/o", age: 18)
      FlightPassenger.create!(passenger: @passenger_6, flight: @flight)
    end

    it 'count_of_adults' do
      expect(@flight.count_of_adults).to eq 4
    end

    it 'count_of_minors' do
      expect(@flight.count_of_minors).to eq 2
    end
  end
end
