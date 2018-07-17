module TopicsHelper
  def get_tags(tags)
    return [] if tags.nil? || tags.length == 0
    return tags.split(/,/)
  end
end
