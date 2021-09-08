class PostsController < ApplicationController
  def index
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
    @posts = @topic.posts.includes(:user)
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.new(post_params)
    if @post.save!
      redirect_to topic_posts_path(@topic)
    else
      @posts = @topic.posts.includes(:user)
      render :index
    end
  end

  private
  def post_params
    params.require(:post).permit(:content, :image).merge(user_id: current_user.id)
  end
end
