class ApplicationController < ActionController::Base
  before_action :basic_auth
  helper_method :current_user, :logged_in?

  def login?
    if current_user.nil?
        redirect_to login_path, alert: "you have to login"
    end
  end

  def already_login?
    unless current_user.nil?
        redirect_to user_path(current_user.id), notice: "you are already login"
    end
  end

  def current_user
    if session[:user_id]
        current_user ||= User.find(session[:user_id])
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
