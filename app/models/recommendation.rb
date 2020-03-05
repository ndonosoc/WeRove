class Recommendation < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :category, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price_range, presence: true
  validates :duration, presence: true
  # validates :reservation, presence: true

  has_one_attached :photo

  CATEGORIES = [
    {
      title: "Sports",
      icon: "utensils"
    },
    {
      title: "Food",
      icon: "utensils"
    },
    {
      title: "Outdoors",
      icon: "utensils"
    },
    {
      title: "Nightlife",
      icon: "utensils"
    },
    {
      title: "Arts & Culture",
      icon: "utensils"
    },
    {
      title: "Sightseeing",
      icon: "utensils"
    }
  ]
end
