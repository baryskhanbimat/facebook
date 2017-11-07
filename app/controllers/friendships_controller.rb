class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @users = User.all
    @friendships = current_user.friendships.all
    respond_with(@friendships)
  end

  def create
    @friendship = current_user.friendships.create(user_id: current_user.id, friend_id: params[:friend_id]) unless friendship_exists?
    if @friendship.present? && @friendship.save
      flash[:notice] = 'Added friend.'
    else
      flash[:error] = 'Unable to add friend.'
    end
    redirect_to root_path
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Removed friendship.'
    redirect_to current_user
  end

  private

    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id)
    end

    def friendship_exists?
      Friendship.where(user_id: current_user.id, friend_id: params[:friend_id]).count > 0
    end
end
