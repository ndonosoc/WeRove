class RatingsController < ApplicationController

  def index
    @ratings = policy_scope(Rating)
  end

  def new
    @match = Match.find(params[:match_id])
    authorize @match
    @rating = Rating.new
    authorize @rating
  end

  def create
    @rating = Rating.new
    authorize @rating
    match = Match.find(params[:match_id])
    authorize match
    if match.local == current_user
      rated = match.tourist
    else
      rated = match.local
    end
    @rating.rating = rating_params["rating"]
    @rating.rater_id = current_user.id
    @rating.rated_id = rated.id
    @rating.match = match
    @rated = User.find(@rating.rated_id)
    if @rating.save
      @rated.update_rating
      redirect_to match_path(match), alert: "Thank you for your rating!"
    else
      raise
      redirect_to match_path(match), alert: "The rating was not saved!"
      return
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating)
  end
end
