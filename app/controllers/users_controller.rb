class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @country = IsoCountryCodes.search_by_name(@user.city.scan(/\,(.*)/)[0][0])[0].alpha2
  end
end
