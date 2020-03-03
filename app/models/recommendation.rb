class Recommendation < ApplicationRecord
  belongs_to :user
  validates :category, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price_range, presence: true
  validates :duration, presence: true
  validates :reservation, presence: true

  has_one_attached :photo
end
