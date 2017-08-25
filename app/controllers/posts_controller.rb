class PostsController < ApplicationController
  def new
    @posts = Post.all
  end

  def create
    @posts = Post.create!(post_params)
    redirect_to @posts
  end

  def show
    @posts = Post.find(params[:id])
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
