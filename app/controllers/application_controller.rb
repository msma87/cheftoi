class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :store_navigation_history

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  private

  def store_navigation_history
    # Initialize the session array if it doesn't exist
    session[:navigation_history] ||= []

    # Add the current URL to the history
    session[:navigation_history] << request.fullpath

    # Limit the history size to the last 3 pages to conserve memory
    session[:navigation_history] = session[:navigation_history].last(3)
  end
end
