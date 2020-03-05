class RecommendationsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # Index should match 5 recommendations according to Location and InterestsCategory picked. How to play interest?
    # Save interest picked? How? request.cookies? (como lo capturo?)
    # interestPicks = []

    @recommendations = Recommendation.joins(user: :interests).where('interests.title' => params[:interests]).limit(4)

    # params = {
    #   location: "Recoleta",
    #   category: ["Sports", "Gaming"]
    # }
    raise
    # search recommendations by city and categories (NOT FINISHED)
    # @recommendations = policy_scope(Recommendation).where(location: params[:location]).limit(4)
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end
    # search recommendations by city and categories (NOT FINISHED, add location with geocoding GEM)

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
