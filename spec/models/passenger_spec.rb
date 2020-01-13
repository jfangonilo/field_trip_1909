require 'rails_helper'

RSpec.describe Passenger do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_numericality_of(:age).only_integer}
  end

  describe "relationships" do
    it {should have_many(:flight_passengers)}
    it {should have_many(:flights).through(:flight_passengers)}
  end
end