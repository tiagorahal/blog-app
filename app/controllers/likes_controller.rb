class LikesController < ApplicationController
  def create
    @post = Post.find_by(id: params[:id])
    if already_liked?
      flash[:alert] = 'Already liked'
    else
      @post.likes.create(user_id: session[:user_id])
    end
    redirect_back(fallback_location: root_path)
  end

  def already_liked?
    Like.where(user_id: session[:user_id], post_id: params[:id]).exists?
  end
end
