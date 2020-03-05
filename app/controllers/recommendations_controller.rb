class RecommendationsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  skip_after_action :verify_authorized
  before_action :skip_pundit?

  def index
    params = {
      location: "Recoleta",
      category: ["Sports", "Gaming"]
    }
    # search recommendations by city and categories (NOT FINISHED)
    @recommendations = policy_scope(Recommendation).where(location: params[:location]).limit(4)
  end

  def show
    @recommendation = Recommendation.find(params[:id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end
    # search recommendations by city and categories (NOT FINISHED, add location with geocoding GEM)
    # @recommendations = Recommendation.joins(user: :interests).where('interests.title' => params[:category])

  def new
    @recommendation = current_user.recommendations.build
    authorize @recommendation
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.user = current_user
    @recommendation.category = params[:recommendation][:category].join(",")
    authorize @recommendation
    if @recommendation.save
      redirect_to recommendation_path(@recommendation)
    else
      render 'new'
      raise
    end
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:title, :description, :location, :price_range, :reservation, :duration, :user_id)
  end
end
