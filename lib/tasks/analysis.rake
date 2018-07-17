require File.expand_path('../../../config/environment', __FILE__) 
desc 'analysis blog'
task :analysis_blog do
  path = `pwd`.delete("\n") << "/public/blogs/"
  Dir.open(path).each do |file|
    next if file =~ /^\./
    puts "正在解析#{file}..."
    title = file.gsub(/\.md$/,"")
    blog = {}
    header_open = false
    body = ""
    all_content= ""
    File.open("#{path}#{file}","r").each_line do |line|
      if line.strip == "---" && header_open == false
        header_open = true
        next
      end
      if header_open == true
        if line =~ /tags/
          blog[:tags] = line.split(":")[-1].strip.split(",").map{|a| a if a.strip.size > 0}.compact.join(",")
        elsif line.strip == "---"
          header_open = false
        end
      elsif
        body += line
      end
      all_content += line
    end
    body = all_content if body.length == 0
    blog[:body] = body
    if topic = Topic.find_by_title(title)
      topic.update(body:blog[:body],tags:blog[:tags])
    else
      Topic.create!(title:title,body:blog[:body],tags:blog[:tags])
    end
    `rm #{path}#{file}`
  end
end
