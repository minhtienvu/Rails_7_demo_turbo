class ApplicationController < ActionController::Base
  # To solve the second bullet point, we need unauthenticated users to be able to access the login form; 
  # otherwise, they couldn't sign in. Let's add an exception to our callback:
  before_action :authenticate_user!, unless: :devise_controller?

  private
  
  def current_company
    @current_company ||= current_user.company if user_signed_in?
  end
  helper_method :current_company
end
