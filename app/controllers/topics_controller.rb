class TopicsController < ApplicationController
  def index

  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      render template: 'posts/index', posts: 'index'
    end
  end

  private

  def topic_params
    params.require(:topics).permit(:title).merge(user_id: current_user.id)
  end
end
