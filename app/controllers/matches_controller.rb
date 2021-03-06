 class MatchesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  skip_after_action :verify_authorized

  def index
    @matches = policy_scope(Match).where(tourist_id: current_user.id, accepted: true).or(policy_scope(Match).where(local_id: current_user.id, accepted: true))
    @matches = @matches.order(created_at: :desc)
  end

  def show
    @match = Match.find(params[:id])
    if @match.local == current_user
      @matched_user = @match.tourist
    else
      @matched_user = @match.local
    end

    current_user.mark_match_as_seen(@match)

    authorize @match
    @geocode = Geocoder.search([@matched_user.latitude, @matched_user.longitude])

    @people_connected = policy_scope(Match).where(tourist_id: @matched_user.id, accepted: true).or(policy_scope(Match).where(local_id: @matched_user.id, accepted: true)).count

  end

  def matchme
    # choose last 5 matches
    @matches = current_user.tourist_matches.where(accepted: nil).order(created_at: :desc).limit(5)
    @list = []
    if !@matches.empty?
      last_city = @matches.first.local.nearbys(30)
      @list = [@matches.first]

      @matches.each do |match|
        if last_city.include?(match.local)
          @list << match
        end
      end
    end

    if @list.empty?
      redirect_to matches_path
      return
    end
    # select from those matches the ones that are from the same city as the last match
  end

  def create
    array = Match.matcher(current_user, params["location"]).reverse

    if array.empty?
      redirect_to root_path, alert: "No matches for that city"
      return
    end

    for i in (0...5) do
      if array[i]
        @match = Match.new(tourist: current_user, local: array[i][0], percentage: array[i][1])
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

    if update_params["accepted"] == "true"
      @match.accepted = true
    elsif update_params["accepted"] == "false"
      @match.accepted = false
    end

    if @match.save
        respond_to do |format|
        format.html { redirect_to match_path(@match) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    end
    # redirect_to matchme_path

  end

  private
  # def create_params
  #   params.require(:match).permit(:location)
  # end

  def update_params
    params.require(:match).permit(:accepted, :id)
  end
end
