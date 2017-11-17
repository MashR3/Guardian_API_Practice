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

  def extract_webtitles(keyword)
    title_array = []
    content_by_keyword(keyword)['response']['results'].each do |i|
      title_array << i['webTitle']
    end
  end

  def extract_weburl(keyword)
    url_array = []
    content_by_keyword(keyword)['response']['results'].each do |i|
      url_array << i['webUrl']
    end
    p url_array
  end

  def get_title_and_url(keyword)
    result_hash = {}
    content_by_keyword(keyword)['response']['results'].each do |i|
      result_hash[i['webTitle']] = i['webUrl']
    end
    # p result_hash
  end

  def get_title_and_section(keyword)
    result_hash = {}
    content_by_keyword(keyword)['response']['results'].each do |i|
      result_hash[i['webTitle']] = i['sectionName']
    end
    # p result_hash
  end

 def article_theme_counter(keyword)
   theme = {}
   content_by_keyword(keyword)['response']['results'].each do |i|
      theme[i['sectionName']].each do
       if (theme.key?(i))
         theme[i] += 1
       else
         theme[i] = 1
       end
     end
   end
   p theme
 end


end

x = Content.new
x.article_theme_counter("green")
