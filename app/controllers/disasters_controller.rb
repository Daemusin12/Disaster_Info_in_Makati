class DisastersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only
  before_action :set_disaster, only: [:edit, :update, :destroy]

  def index
    @disasters = Disaster.all
  end

  def new
    @disaster = Disaster.new
  end

  def create
    @disaster = Disaster.new(disaster_params)
    if @disaster.save
      redirect_to disasters_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @disaster.update(disaster_params)
      redirect_to disasters_path
    else
      render :edit
    end
  end

  def destroy
    @disaster.destroy
    flash[:notice] = 'You cant delete the disaster type, that has posts'
    redirect_to disasters_path
  end

  private

  def admin_only
    unless 'admin' == current_user.genre
      flash[:notice] = 'You are not a administrator'
      redirect_to posts_path
    end
  end
  def set_disaster
    @disaster = Disaster.find(params[:id])
  end

  def disaster_params
    params.require(:disaster).permit(:name)
  end
end
