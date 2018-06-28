require File.expand_path('../../../config/environment', __FILE__) 
desc 'delete blog'
task :delete_blog,[:files] do |t,args|
  all_files = (args.extras << args[:files])
  all_files.each do |file|
   if topic = Topic.find_by_title(file.split(".")[0])
      topic.delete
      puts "删除   #{file}"
    end
  end
end
