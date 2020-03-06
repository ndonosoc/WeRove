class Message < ApplicationRecord
  after_create :broadcast_message

  belongs_to :match
  belongs_to :messager, class_name: "User"
  validates :messager_id, presence: true

  def broadcast_message
    ActionCable.server.broadcast("match_#{self.match.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "messages/message_ac",
        locals: { message: self, user_is_messages_author: false }
      ),
      current_user_id: messager_id
    })
  end
end
