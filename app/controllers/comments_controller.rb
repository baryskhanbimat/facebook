class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:body))
    @comment.user_id = current_user
    redirect_to root_path
  end
end
