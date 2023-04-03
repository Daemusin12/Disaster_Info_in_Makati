class DisastersController < ApplicationController
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
    redirect_to disasters_path
  end

  private

  def set_disaster
    @disaster = Disaster.find(params[:id])
  end

  def disaster_params
    params.require(:disaster).permit(:name)
  end
end
