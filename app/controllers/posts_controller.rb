class PostsController < ApplicationController
  def index
    user = User.find_by(id: params[:user])
    @user = user
    @posts = user.posts
  end

  def show
    @user = User.find_by(id: params[:user])
    @post = Post.find_by(id: params[:id])
  end
end
