class Match < ApplicationRecord
  belongs_to :local, class_name: "User", foreign_key: 'local_id'
  belongs_to :tourist, class_name: "User", foreign_key: 'tourist_id'
  has_one :rating
  has_many :messages
  validates :local_id, presence: true
  validates :tourist_id, presence: true

  def self.matcher(tourist, location)
    # create a storage hash
    hash = {}

    # see every user interests'
    User.near(location, 10).each do |local|
      score = 0
      if local != tourist && !tourist.local_ids.include?(local.id)
        local.interests.each do |interest|
    # count +1 for every interest in common with the tourist's interests
          if tourist.interests.include?(interest)
            score += 1
          end
        end
    # store in a hash local: score
        hash[local] = score.to_i
      end
    end
    # order users by matching score
    list = hash.sort_by{ |k,v| -v }

    # select 5 with highest scores
    list[0...5]
  end

end
