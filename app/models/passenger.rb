class Passenger < ApplicationRecord
  validates_presence_of :name, :age
  validates_numericality_of :age, only_integer: true

  has_many :flights
  has_many :flight_passengers, through: :flights
end