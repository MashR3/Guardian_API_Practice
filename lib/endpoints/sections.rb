require 'HTTParty'
require 'json'
require 'yaml'

class Sections
  include HTTParty

  base_uri 'https://content.guardianapis.com/'
# https://content.guardianapis.com/lifeandstyle
  def initialize
    token2 = YAML.load_file('token.yml')
    @token2 = token2['token2']
  end

  def section_search(section)
    JSON.parse(self.class.get("/" + "#{section}" + "#{@token2}").body)
  end

end

x = Sections.new
puts x.section_search("lifeandstyle")
