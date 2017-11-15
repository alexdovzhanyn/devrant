require "devrant/version"
require "httparty"
require "json"
require "pry"
require "devrant/api"
require "devrant/rants"
require "devrant/users"

module Devrant

  def structuralize(json)
    JSON.parse(json.body, object_class: OpenStruct)
  end

  def extend_request(var, options)
    { "#{var}": self.class.default_options[:query].merge(options) }
  end

end
