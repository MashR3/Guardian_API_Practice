require 'HTTParty'
require 'json'
require 'yaml'

class Content
  include HTTParty

  base_uri 'https://content.guardianapis.com/search?q='

  def initialize
    token = YAML.load_file('token.yml')
    @token = token['token']
  end

  # Return data by keyword
  def content_by_keyword(keyword)
    x = keyword.gsub(" ", "%20")
    JSON.parse(self.class.get("#{x}" + "#{@token}").body)
  end

  # Search and return content by exact keyword
  def content_by_exact(keyword)
    JSON.parse(self.class.get("#{"keyword"}" + "#{@token}").body)
  end

end

puts Content.new.content_by_keyword("apple Luke pie")
