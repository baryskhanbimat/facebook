class PostsController < ApplicationController
  respond_to :js
  before_action :authenticate_user!

  def index
    @post = current_user.posts.build
    respond_with @posts = Post.all.order('created_at DESC')
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save!
    respond_with @posts = Post.all
    # mail to: 'baryskhan.bimat@ce.sdu.edu.kz', subject: 'Test'
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
