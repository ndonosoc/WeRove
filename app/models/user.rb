class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :local_matches, class_name: "Match", foreign_key: 'local_id'
  has_many :tourist_matches, class_name: "Match", foreign_key: 'tourist_id'
  has_many :locals, through: :tourist_matches, class_name: "User"
  has_many :recommendations
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_many :bookmarks
  has_many :bookmarkedrecommendations, through: :bookmarks, source: "recommendation"
  has_many :ratings, foreign_key: "rated_id"
  has_many :reviews
  has_many :rated_recommendations, through: :reviews, source: "recommendation"
  has_many :messages, class_name: "Message", foreign_key: "receiver_id"

  has_one_attached :photo

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
  before_save :set_country_flag

  def update_rating
    ratings = self.ratings
    sum = 0
    ratings.each do |rating|
      sum += rating.rating
    end
    self.score = sum.fdiv(ratings.length).round(2)
    self.save
  end

  def mark_messages_as_read(match)
    self.messages.where(read: nil, match: match.id).each do |message|
      message.update(read: true)
    end
  end

  def mark_match_as_seen(match)
    if match.local == self
      match.update(local_seen: true)
    elsif match.tourist == self
      match.update(tourist_seen: true)
    end
  end

  def set_country_flag
    geocode = Geocoder.search([self.latitude, self.longitude])
    country = IsoCountryCodes.search_by_name(geocode.first.country).first.alpha2
    self.country_flag = country
  end

  # validates :first_name, presence: true, uniqueness: true
  # validates :last_name, presence: true, uniqueness: true
  # validates :email, presence: true, uniqueness: true
  # validates :password, presence: true, uniqueness: true
  # validates :city, presence: true, uniqueness: true
  # validates :languages, presence: true
  # validates :gender, presence: true
end
