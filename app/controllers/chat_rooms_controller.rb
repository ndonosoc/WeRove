<<<<<<< HEAD
# class ChatRoomsController < ApplicationController
#   def show
#     @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
#   end
# end
=======
class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:match_id])
  end
end
>>>>>>> master