class ShortUrlController < ApplicationController

  def index
    redirect_to posts_path
  end

  def show
    @post = Post.find_by(short_url: params[:short_url])
    redirect_to post_path(@post.id)
  end
end
