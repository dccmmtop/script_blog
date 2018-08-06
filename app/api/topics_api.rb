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
      if title && body
        Topic.create(title:title,tag:tag,body:body)
        {status:0, message: "success",data:{}}
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
      return {status:0}
    end

    get :ping do
      { data: "pong" }
    end

  end
end
