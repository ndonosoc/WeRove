class Match < ApplicationRecord
  belongs_to :local, class_name: "User", foreign_key: 'local_id'
  belongs_to :tourist, class_name: "User", foreign_key: 'tourist_id'
  has_many :ratings
  has_many :messages
  validates :local_id, presence: true
  validates :tourist_id, presence: true


    # create a storage hash

    # group user interests by parent

    # see every user interests'

      # check that the other user != current user and that he's not already in his matches

        # group user's interests
  def self.matcher(tourist, location)
    storage = {}
    tourist_interests = tourist.interests.group_by { |interest| interest.parent_id }
    User.near(location, 10).each do |local|
      score = 0
      if local.id != tourist.id && !tourist.local_ids.include?(local.id) && !local.interests.empty?
        local_interests = local.interests.group_by { |interest| interest.parent_id }
        local_interests.keys.each do |parent_id|
          if tourist_interests.keys.include?(parent_id.to_i)
            local_interests[parent_id.to_i].each do |interest|
              if tourist_interests[parent_id.to_i].find { |int| int.id == interest.id }
                score += 1
              end
            end
          end
        end
      end
      divisor = (tourist.interests.count + local.interests.count)
      if divisor != 0
        match_percentage = (score * 100) / (divisor/2)
        storage[local] = match_percentage
      else
        storage[local] = 0
      end
    end
    return storage.sort_by{ |k,v| -v}[0...5]
  end

        # check for coincidences in the interests parents

            # if coincidence in parent_id, check for coincidences in each interest
                # count +1 for every interest in common

      # store in a hash local: score
    # order users by matching score
    # list = storage.sort_by{ |k,v| -v }

    # select 5 with highest scores
    # list[0...5]

  def self.recommendations_matcher(tourist, location)
    # create a storage hash
    hash = {}

    # see every user interests'
    User.near(location, 10).each do |local|
      score = 0
      if local != tourist
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
    list[0...20]
  end

end
