class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recommendation
  skip_before_action :verify_authenticity_token
  skip_after_action :verify_authorized

  def index
    @reviews = policy_scope(Review).order(created_at: :desc)
  end

  def new
    @review = Review.new
    authorize @review

    if current_user.rated_recommendations.include?(@recommendation)
       flash[:notice] = "You already reviewed this recommendation"
       redirect_back(fallback_location: root_path)
       return
     end
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    authorize @review
    @review.recommendation = @recommendation
    if @review.save!
      @recommendation.update_rating
      redirect_to recommendation_path(@recommendation)
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_recommendation
    @recommendation = Recommendation.find(params[:recommendation_id])
    authorize @recommendation
  end
end
