class Passenger < ApplicationRecord
  validates_presence_of :name, :age
  validates_numericality_of :age, only_integer: true
end