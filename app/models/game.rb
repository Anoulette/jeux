class Game < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :street_number, presence: true
  validates :street, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
end
