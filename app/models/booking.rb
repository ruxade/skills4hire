class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_one :review
  validates :status, presence: true
end
