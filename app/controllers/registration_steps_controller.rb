class RegistrationStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal

  def show
    @user = current_user
    @groups = Interest.where.not(parent_id: nil).group_by { |interest| interest.parent.title if interest.parent.present? }
    render_wizard
  end

end
