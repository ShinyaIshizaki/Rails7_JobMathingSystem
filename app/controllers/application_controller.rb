class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  def handle_unauthorized_access
    flash[:danger] = "You need to login."
    redirect_to login_path
  end
end
