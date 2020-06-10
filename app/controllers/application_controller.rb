class ApplicationController < ActionController::Base
  def signed_in_only!
    redirect_to login_path unless current_user
  end

  def admin_only!
    redirect_to root_path, alert: 'Unauthorized access' unless current_user.admin?
  end

  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user
end
