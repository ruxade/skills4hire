class Skill < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews , through: :bookings
  has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0, or_equal: 5 }
end
