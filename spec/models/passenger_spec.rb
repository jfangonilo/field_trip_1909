require 'rails_helper'

RSpec.describe Passenger do
   it {should validate_presence_of :name}
   it {should validate_presence_of :age}
   it {should validate_numericality_of(:age).only_integer}
end