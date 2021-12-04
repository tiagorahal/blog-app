class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    user = User.find_by(id: params[:id])
    @user = user
    @posts = user.show_recent
  end

  def new; end

  def create
    user = User.new(
      name: params[:name],
      photo: params[:photo],
      bio: params[:bio],
      posts_counter: 0
    )

    return unless user.save

    flash[:notice] = 'User was successfully created'
    session[:user_id] = user.id
    redirect_to users_path
  end
end
