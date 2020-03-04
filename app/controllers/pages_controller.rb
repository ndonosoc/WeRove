class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @match = Match.new
    authorize @match
  end
end
