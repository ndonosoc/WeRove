class Recommendation < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :reviews, dependent: :destroy
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

  def self.matcher(interests, location)
    # create a storage hash
    @list = []

    # see every user interests'
    User.near(location, 10).each do |local|
      local.interests.each do |interest|
    # count +1 for every interest in common with the tourist's interests
        if local.interests.include?(interest)
          local.recommendations.each do |recommendation|
            @list << recommendation
          end
        end
      end
    end

    return @list

  end
end
