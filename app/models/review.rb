class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recommendation
  # has_one :recommender, through: :recommendation
  # only uncomment if needed, it might break the create new reviews.
  validates :rating, presence: true
  validates :content, presence: true
end
