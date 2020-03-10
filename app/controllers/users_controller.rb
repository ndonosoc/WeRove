class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  skip_before_action :verify_authenticity_token
  # skip_after_action :verify_authorized
  # after_action :skip_pundit?

  def index
    @groups = current_user.interests.where.not(parent_id: nil).group_by { |interest| interest.parent.title if interest.parent.present? }
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @geocode = Geocoder.search([current_user.latitude, current_user.longitude])
    @people_connected = policy_scope(Match).where(tourist_id: current_user.id, accepted: true).or(policy_scope(Match).where(local_id: current_user.id, accepted: true)).count
  end

end
