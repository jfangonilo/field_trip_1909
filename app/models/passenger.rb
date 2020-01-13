class Passenger < ApplicationRecord
  validates_presence_of :name, :age
  validates_numericality_of :age, only_integer: true

  has_many :flights, through: :flight_passengers
  has_many :flight_passengers
end