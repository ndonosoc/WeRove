class RecommendationsController < ApplicationController
  skip_before_action :authenticate_user!

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
  end
    # search recommendations by city and categories (NOT FINISHED, add location with geocoding GEM)
    # @recommendations = Recommendation.joins(user: :interests).where('interests.title' => params[:category])
end
