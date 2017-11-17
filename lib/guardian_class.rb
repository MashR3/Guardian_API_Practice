require 'HTTParty'
require 'json'
require 'yaml'
require_relative 'endpoints/content'
require_relative 'endpoints/editions'
require_relative 'endpoints/sections'
require_relative 'endpoints/single_item'
require_relative 'endpoints/tags'

class Guardian

  def content
    Content.new
  end

  def tags
    Tags.new
  end

  def editions
    Editions.new
  end

  def sections
    Sections.new
  end

end
