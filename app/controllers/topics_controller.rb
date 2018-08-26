class TopicsController < ApplicationController
  include TopicsHelper
 def index
    @q = Topic.search(params[:q])
    @topics = @q.result(distinct: true).order(created_at: :desc)
  end

  def show
    @topic = Topic.friendly.find(params[:id])
    @topic.update(reading_count: @topic.reading_count + 1)
    @q = Topic.ransack(params[:search])
  end
end
