class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :local_matches, class_name: "Match", foreign_key: 'local_id'
  has_many :tourist_matches, class_name: "Match", foreign_key: 'tourist_id'
end
