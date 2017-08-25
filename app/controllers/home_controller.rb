class HomeController < ApplicationController
  def index
    @posts = Post.all
  end

  def list
    @posts = Post.all
  end
end
