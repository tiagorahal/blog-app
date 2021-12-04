class CommentsController < ApplicationController
  def create
    comment = Comment.new(
      text: params[:text],
      user_id: session[:user_id],
      post_id: params[:id]
    )

    return unless comment.save

    flash.now[:notice] = 'Comment successfully saved'
    redirect_back(fallback_location: root_path)
  end
end
