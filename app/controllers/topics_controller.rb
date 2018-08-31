class TopicsController < ApplicationController
  include TopicsHelper
  def index
    @q = Topic.search(params[:q])
    if params[:q] &&  params[:q].values.first == ENV['SCRIPT_BLOG_ACCESS']
      @topics = Topic.where("hidden is true").order(created_at: :desc).page(params[:page]).page(params[:page]).per(20)
    else
      @topics = @q.result(distinct: true).where("hidden is not true").order(created_at: :desc).page(params[:page]).per(20)
    end
  end

  def show
    @topic = Topic.friendly.find(params[:id])
    @topic.update(reading_count: @topic.reading_count + 1)
    @q = Topic.ransack(params[:q])
  end
end
