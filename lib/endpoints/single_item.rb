# require 'HTTParty'
# require 'json'
# require 'yaml'
#
# class SingleItem
#   include HTTParty
#
#   base_uri 'https://content.guardianapis.com/editions'
#
#   def initialize
#     token2 = YAML.load_file('token.yml')
#     @token2 = token2['token2']
#   end
#
#   def check_editions
#     JSON.parse(self.class.get("#{@token2}").body)
#   end
#
# end
