require 'HTTParty'
require 'json'
require 'yaml'

class Tags
  include HTTParty

  base_uri 'https://content.guardianapis.com/'

  def initialize
    token = YAML.load_file('token.yml')
    @token = token['token']
  end

  def find_tags(search)
    JSON.parse(self.class.get("/tags?q=" + "#{search}" + "#{@token}").body)
  end

  # Return data by tag(s)
  def content_by_tag(tags)
    x = tags.gsub(" ", "/")
    JSON.parse(self.class.get("/search?tag=" + "#{x}" + "#{@token}").body)
  end

end

# x = Tags.new
# puts x.content_by_tag("environment recycling")
