class ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  skip_after_action :verify_authorized

  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:match_id])
  end
end
