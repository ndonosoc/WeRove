class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  skip_after_action :verify_authorized
  before_action :skip_pundit?
  after_action :skip_pundit?

  def index
    @groups = current_user.interests.where.not(parent_id: nil).group_by { |interest| interest.parent.title if interest.parent.present? }
  end

  def show
    @user = User.find(params[:id])
    if @user.city?
      @country = IsoCountryCodes.search_by_name(@user.city.scan(/\,(\W\w*\W\w*|\W\w*)\b/)[-1][0].strip)[0].alpha2
    end
  end

end
