module Api
  class ApplicationApi < Grape::API
    before do
      error!("滚!!") unless validates
    end

    helpers do
      def validates 
        request.headers['Access'] == ENV['SCRIPT_BLOG_ACCESS']
      end
    end
    mount Api::TopicsApi => '/topics'
  end
end
