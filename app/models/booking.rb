class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers, inverse_of: :booking, dependent: :destroy

  # Allows us to create multiple passengers at once in a form
  accepts_nested_attributes_for :passengers, allow_destroy: true
end
