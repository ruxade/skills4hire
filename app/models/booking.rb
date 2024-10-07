class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :skills
  has_one :review
  validates :status, presence: true
end
