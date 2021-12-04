class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:name])
    session[:user_id] = @user.id
    flash[:notice] = 'Successfully logged in'
    redirect_to '/users'
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Successfully logged out'
    redirect_to '/users'
  end
end
