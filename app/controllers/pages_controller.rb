class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  after_action :skip_pundit?

  def home
    @match = Match.new
  end

  def privacy
  end
end
