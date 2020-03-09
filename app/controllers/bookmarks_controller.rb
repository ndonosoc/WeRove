class BookmarksController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  skip_after_action :verify_authorized
  before_action :skip_pundit?

  def index
    #to be done after the bookmark save in recommendation is working
    @bookmarks = policy_scope(Bookmark).where(user_id: current_user.id).group_by(&:category)
    authorize @bookmark
    raise
  end

  def create
    @bookmark = Bookmark.new
    authorize @bookmark

    @bookmark.user = current_user
    @bookmark.recommendation_id = params[:recommendation_id].to_i


    if @bookmark.save
      flash[:notice] = "Saved to bookmarks"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "Couldn't save bookmark"
      redirect_back(fallback_location: root_path)
      return
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "Deleted from bookmarks"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "Couldn't delete bookmark"
      redirect_back(fallback_location: root_path)
      return
    end
  end

end
