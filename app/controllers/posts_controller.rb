class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :validate_post_owner, only: [:edit, :update, :destroy]
  def index
    @posts_top_3 = Post.includes(:disasters, :user, :comments).order(:comments_count).reverse_order.first(3)
    @posts = Post.includes(:disasters, :user, :comments).order(:comments_count).reverse_order.offset(3)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if Rails.env.development?
      @post.ip_address = Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
      @post.country_code = Geocoder.search(@post.ip_address).first.country
      @post.country = Geocoder.search(@post.country_code).first.country
      @post.isp = Geocoder.search(@post.ip_address).first.data["org"]
    else
      @post.ip_address = request.remote_ip
    end
    if @post.save
      Post.reset_counters(@post.id, :comments)
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def validate_post_owner
    unless @post.user == current_user
      flash[:notice] = 'the post not belongs to you'
      redirect_to posts_path
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :address, :image, disaster_ids: [])
  end

end
