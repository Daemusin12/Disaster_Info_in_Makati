class UsersController < ApplicationController
  def index
    @posts = Post.includes(:disasters, :user, :comments).where(user_id: current_user.id)
  end
end
