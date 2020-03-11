class Recommendation < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :category, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price_range, presence: true
  validates :duration, presence: true
  # validates :reservation, presence: true

  has_one_attached :photo
  before_save :set_photo

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

  def set_photo
    if !self.photo.attached?
      file = URI.open("https://crossword365.com/thumbnail/unknown-place.png")
      self.photo.attach(io: file, filename: "#{self.title}-#{self.created_at}.jpg", content_type: "image/png")
      self.save
    end
  end

  def update_rating
    ratings = self.reviews
    sum = 0
    ratings.each do |rating|
      sum += rating.rating.to_i
    end
    self.rating = sum.fdiv(ratings.count).round(1)
    self.save
  end
end
