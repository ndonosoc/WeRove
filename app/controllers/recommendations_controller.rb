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
end
