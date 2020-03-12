class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

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

  validates :first_name, presence: true
  validates :city, presence: true
  validates :birthday, presence: true

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
  before_save :set_country_flag
  before_save :set_age


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

  def set_age
    age = (Time.now.to_s(:number).to_i - self.birthday.to_time.to_s(:number).to_i)/10e9.to_i
    self.age = age
  end


  private

  def set_photo
    if !self.photo.attached?
      file = URI.open("https://www.cashforkidsgive.co.uk/static/images/peer-2-peer/no-profile-pic.png")
      self.photo.attach(io: file, filename: "#{self.first_name}-#{self.id}.png", content_type: "image/png")
      self.save
    end
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name")
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

end
