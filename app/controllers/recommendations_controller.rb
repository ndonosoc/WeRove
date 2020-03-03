class RecommendationsController < ApplicationController
  def index
    params = {
      location: "Recoleta",
      category: ["Sports", "Gaming"]
    }
    # search recommendations by city and categories (NOT FINISHED, add location with geocoding GEM)
    @recommendations = Recommendation.joins(user: :interests).where('interests.title' => params[:category])
end
