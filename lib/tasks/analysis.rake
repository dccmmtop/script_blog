#!/usr/local/rvm/rubies/ruby-2.3.3/bin/ruby
require ("/var/www/script_blog/config/environment") 
path = "/var/www/script_blog/public/blogs/"
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
