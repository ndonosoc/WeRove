class Match < ApplicationRecord
  belongs_to :local, class_name: "User", foreign_key: 'local_id'
  belongs_to :tourist, class_name: "User", foreign_key: 'tourist_id'
end
