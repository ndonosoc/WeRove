class MatchesController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @match = Match.new
    authorize @match
    @tourist = current_user
    authorize @tourist
    array = Match.matcher(@tourist)

    for i in (0...5) do
      Match.create(tourist: @tourist, local: array[i][0])
    end
  end

  def update
    @match = Match.find(params[:id])
    authorize @match

    if update_params[:accepted] == true
      @match.accepted = true
      @match.save
    elsif update_params[:accepted] == false
      @match.accepted = false
      @match.save
    end

  end

  private

  def update_params
    params.require(:match).permit(:accepted)
  end
end
