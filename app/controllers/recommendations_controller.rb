class RecommendationsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    params = {
      location: "Recoleta",
      category: ["Sports", "Gaming"]
    }
    # search recommendations by city and categories (NOT FINISHED)
    @recommendations = Recommendation.where(location: params[:location]).where_in().limit(4)
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end
    # search recommendations by city and categories (NOT FINISHED, add location with geocoding GEM)
    # @recommendations = Recommendation.joins(user: :interests).where('interests.title' => params[:category])

  def new
    @recommendation = Recommendation.new
    authorize @recommendation
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    authorize @recommendation
    if @recommendation.save
      redirect_to recommendation_path(@recommendation)
    else
      render 'new'
    end
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:title, :category, :description, :location, :price_range, :reservation, :duration)
  end
end
