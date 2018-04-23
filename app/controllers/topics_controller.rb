class TopicsController < ApplicationController
  def index
    @topics = Topic.all.order("reading_count desc,created_at desc")
  end

  def show
    @topic = Topic.friendly.find(params[:id])
    @topic.update(reading_count: @topic.reading_count + 1)
  end
end
