class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped
  before_action :skip_pundit?

  def home
    @match = Match.new
    authorize @match
  end
end
