class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.includes(:disasters, :user, :comments).where(user_id: current_user.id)
  end
end
