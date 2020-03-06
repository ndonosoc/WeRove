class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recommendation

  def index
    @reviews = policy_scope(Review).order(created_at: :desc)
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    authorize @review
    @review.recommendation = @recommendation
    if @review.save!
      redirect_to recommendations_path
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
