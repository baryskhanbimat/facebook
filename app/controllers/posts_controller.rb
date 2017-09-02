class PostsController < ApplicationController
  respond_to :js, :json

  def index
    @post = Post.new
    respond_with @posts = Post.all
  end

  def create
    @post = Post.create!(post_params)
    respond_with @posts = Post.all
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
