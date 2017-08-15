class HomeController < ApplicationController
  def index
    @articles = Post.all
  end

  def list
    @articles = Post.all
  end
end
