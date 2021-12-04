class ApplicationController < ActionController::Base
  helper_method %i[current_user logged_in?]

  def login
    session[:user_id] = User.find_by(name: params[:name]).id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end
end
