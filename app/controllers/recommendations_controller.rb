class RecommendationsController < ApplicationController
  def index
    params = {
      location: "Recoleta",
      category: ["Sports", "Gaming"]
    }
    # search recommendations by city and categories (NOT FINISHED)
    @recommendations = Recommendation.where(location: params[:location]).where_in().limit(4)
  end
end
