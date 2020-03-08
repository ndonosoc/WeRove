class MessagesController < ApplicationController
  def index
    @matches = policy_scope(Match)
    @message = Message.new
    @match = Match.find(params[:match_id])
    if @match.local == current_user
      @matched_user = @match.tourist
    else
      @matched_user = @match.local
    end
    authorize @match
    authorize @message
  end

  def create
    @message = Message.new(message_params)
    @match = Match.find(params[:match_id])
    @message.match = @match
    @message.messager_id = current_user.id
    authorize(@message)
    if @message.save!
      respond_to do |format|
        format.html { redirect_to match_path(@match) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "matches/show" }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
