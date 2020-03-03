class Recommendation < ApplicationRecord
  belongs_to :user
  validates :category, presence: true
  validates :description, presence: true
  validates :location, presence: true, uniqueness: true
  validates :price_range, presence: true, uniqueness: true
  validates :duration, presence: true, uniqueness: true
  validates :reservation, presence: true
end
