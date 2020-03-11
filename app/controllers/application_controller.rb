class ApplicationController < ActionController::Base
  require 'open-uri'
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: [:index, :show, :matchme, :home], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(new_user_session_path)
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :available, :biography, :birthday, { languages: [] }, :occupation, :photo, :first_name, :last_name, :city])

    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :available, :biography, :birthday, { languages: [] }, :occupation, :photo, :first_name, :last_name, :city])
    # For additional in app/views/devise/registrations/edit.html.erb
    # devise_parameter_sanitizer.permit(:account_update, keys: [:email, :available, :biography, :birthday, :languages[], :occupation])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/ ||
    params[:controller] == "registration_steps"
  end

end
