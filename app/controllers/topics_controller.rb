class TopicsController < ApplicationController
  include TopicsHelper
  def index
    @topics = Topic.all.order("created_at desc,reading_count desc")
  end

  def show
    @topic = Topic.friendly.find(params[:id])
    @topic.update(reading_count: @topic.reading_count + 1)
  end

  def search
    key_word = params[:search]
    if key_word.size == 0
      @topics = []
    else
      @topics = Topic.where("title like '%#{key_word}%' or body like '%#{key_word}%' or tags like '%#{key_word}'")
    end
  end
end
