class CommentsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments.create(comment_params)
    @comments.user_id = current_user
    # redirect_to root_path
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
