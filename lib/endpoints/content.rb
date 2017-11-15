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
  def search_content_keyword(keyword)
    JSON.parse(self.class.get("#{keyword}" + "#{@token}").body)
  end

end


# https://content.guardianapis.com/search?q=debate&tag=politics/politics&from-date=2014-01-01&api-key=9ec33225-5e82-4179-8fec-0c4201345640
puts Content.new.search_content_keyword("apple")
