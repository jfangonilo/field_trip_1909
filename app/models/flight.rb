class Flight <ApplicationRecord
  validates_presence_of :number, :date, :time, :departure_city, :arrival_city
  validates_uniqueness_of :number
  belongs_to :airline

  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def count_of_adults
    passengers.where("age >= 18").count
  end

  def count_of_minors
    passengers.where("age < 18").count
  end
end
