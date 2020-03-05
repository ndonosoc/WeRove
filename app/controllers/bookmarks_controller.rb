class BookmarksController < ApplicationController
    skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  skip_after_action :verify_authorized
  before_action :skip_pundit?

  def create
    @bookmark = Bookmark.new
    authorize @bookmark

    @bookmark.user = current_user
    @bookmark.recommendation_id = bookmark_params["id"].to_i


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
    @bookmark = Bookmark.find(bookmark_params["id"].to_i)
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

  private

  def bookmark_params
    params.require(:bookmark).permit(:id)
  end
end
