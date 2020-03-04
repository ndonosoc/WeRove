class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :local_matches, class_name: "Match", foreign_key: 'local_id'
  has_many :tourist_matches, class_name: "Match", foreign_key: 'tourist_id'
  has_many :recommendations
  has_many :user_interests
  has_many :interests, through: :user_interests

  # validates :first_name, presence: true, uniqueness: true
  # validates :last_name, presence: true, uniqueness: true
  # validates :email, presence: true, uniqueness: true
  # validates :password, presence: true, uniqueness: true
  # validates :city, presence: true, uniqueness: true
  # validates :languages, presence: true
  # validates :gender, presence: true

  belongs_to :rater, class_name: "User"

end
