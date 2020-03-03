class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    if @user.city?
      @country = IsoCountryCodes.search_by_name(@user.city.scan(/\W(\w*)\b/)[-1][0].strip)[0].alpha2
    end
  end
end
