class CommentsController < ApplicationController
  before_action :current_user, only: [:create]

  def create
    @comment = @current_user.comments.new(comments_params)
    @comment.user_id = @current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
<<<<<<< HEAD
      flash[:success] = 'Comment saved successfully'
      @comment.update_comments_counter
      redirect_to user_post_path(@current_user.id, Post.find(params[:post_id]))
    else
      flash.now[:error] = 'Error: Comment could not be saved'
=======
      @comment.update_comments_counter
      redirect_to user_post_path(@current_user.id, Post.find(params[:post_id]))
    else
>>>>>>> d1e3747a0516858e8857cb99d26adfeb8218ac8d
      render :new
    end
  end

  def comments_params
    params.require(:comment).permit(:text)
  end
end
