require 'HTTParty'
require 'json'
require 'yaml'

class Editions
  include HTTParty

  base_uri 'https://content.guardianapis.com/editions'

  def initialize
    token2 = YAML.load_file('token.yml')
    @token2 = token2['token2']
  end

  def check_editions
    JSON.parse(self.class.get("#{@token2}").body)
  end

  def get_edition_total
    check_editions['response']['total']
  end

  def get_webtitle
    webtitle_array = []
    check_editions['response']['results'].each do |i|
      webtitle_array << i['webTitle']
    end
  end

  def get_webUrl
    webUrl_array = []
    check_editions['response']['results'].each do |i|
      webUrl_array << i['webUrl']
    end
  end


end

y = Editions.new
# p y.check_editions["response"]["results"][0]["webTitle"].class
# y.get_webtitle
y.get_edition_total
