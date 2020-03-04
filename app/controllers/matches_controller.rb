class MatchesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  skip_after_action :verify_authorized
  before_action :skip_pundit?

  def index
    @matches = policy_scope(Match).where(tourist_id: current_user.id, accepted: nil).order(created_at: :desc).limit(5)
  end

  def matchme
    @matches = current_user.tourist_matches.where(accepted: nil).order(created_at: :desc).limit(5)
  end

  def create
    array = Match.matcher(current_user, params["location"])

    if array.empty?
      redirect_to root_path, alert: "No matches for that city"
      return
    end

    for i in (0...5) do
      if array[i]
        @match = Match.new(tourist: current_user, local: array[i][0])
        authorize @match
        @match.save
      end
    end
    redirect_to matchme_path
  end

  def edit
    current_user.tourist_matches.each do |match|
      authorize match
    end
  end

  def update
    @match = Match.find(update_params["id"].to_i)
    authorize @match

    if update_params["accepted"] == "true"
      @match.accepted = true
      @match.save
    elsif update_params["accepted"] == "false"
      @match.accepted = false
      @match.save
    end

    redirect_to matchme_path

  end

  private
  # def create_params
  #   params.require(:match).permit(:location)
  # end

  def update_params
    params.require(:match).permit(:accepted, :id)
  end
end
