class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @groups = Interest.where.not(parent_id: nil).group_by { |interest| interest.parent.title if interest.parent.present? }
  end

  def show
    @user = User.find(params[:id])
    if @user.city?
      @country = IsoCountryCodes.search_by_name(@user.city.scan(/\,(\W\w*\W\w*|\W\w*)\b/)[-1][0].strip)[0].alpha2
    end
  end

end
