require File.expand_path('../../../config/environment', __FILE__) 
desc 'analysis blog'
task :analysis_blog do
  path = `pwd`.delete("\n") << "/public/blogs/"
    Dir.open(path).each do |file|
      next if file =~ /^\./
      puts "正在解析#{file}..."
      title = file.gsub(/\.md$/,"")
      body = File.open("#{path}#{file}").read
      if topic = Topic.find_by_title(title)
        topic.update(body:body)
      else
        Topic.create!(title:title,body:body)
      end
      `rm #{path}#{file}`
    end
end
