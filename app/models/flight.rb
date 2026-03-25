class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  has_many :bookings, dependent: :destroy

  validates :departure_time, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
