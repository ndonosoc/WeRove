class BookmarksController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  skip_after_action :verify_authorized

  def index
    #to be done after the bookmark save in recommendation is working
    @bookmarks = policy_scope(Bookmark).where(user_id: current_user.id)
    authorize @bookmarks
    @bookmarks = @bookmarks.map { |bookmark| bookmark.recommendation }.group_by{ |recommendation| recommendation.category }
  end

  def create
    @bookmark = Bookmark.new
    authorize @bookmark

    @bookmark.user = current_user
    @bookmark.recommendation_id = params[:recommendation_id].to_i


    if @bookmark.save
      respond_to do |format|
        format.html { redirect_to recommendation_path(@recommendation) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      flash[:notice] = "Couldn't save bookmark"
      redirect_back(fallback_location: root_path)
      return
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @recommendation = Recommendation.find(@bookmark.recommendation_id)
    if @bookmark.destroy
      respond_to do |format|
        format.html { redirect_to recommendation_path(@recommendation) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      flash[:notice] = "Couldn't delete bookmark"
      redirect_back(fallback_location: root_path)
      return
    end
  end

end
