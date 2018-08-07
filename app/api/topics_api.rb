module Api
  class TopicsApi < Grape::API
    format :json

    desc "create"
    params do
      requires :tag, type: String, desc: "tag"
      requires :title, type: String, desc: "title"
      requires :body, type: String, desc: "body"
    end
    post 'create' do
      title = params[:title].to_s
      tag = params[:tag].to_s
      body = params[:body].to_s
      if title.length > 0 && body.length > 0
        if params[:created_at].length > 0
          _params = {title:title,tags:tag,body:body,created_at: DateTime.parse(params[:created_at])}
        else
          _params = {title:title,tags:tag,body:body} 
        end
        if topic = Topic.find_by_title(title)
          topic.update(_params)
        else
          Topic.create(_params)
        end
        return {status:0, message: "#{title} success",data:{}}
      else
        {status:1, message: "title or body should not null"}
      end
    end

    desc "delete"
    params do
      requires :title, type: String, desc: "title"
    end
    delete '/delete' do
      @topic = Topic.find_by_title(params[:title])
      if ! @topic
        return {status:2, message: "not found #{params[:title]}"}
      end
      @topic.delete
      return {status:0, message: "success",data:{}}
    end

    get :ping do
      { data: "pong" }
    end

  end
end
