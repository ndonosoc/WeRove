class Message < ApplicationRecord
  belongs_to :match
  belongs_to :messager, class_name: "User"
  validates :messager_id, presence: true
end
