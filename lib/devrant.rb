require "devrant/version"
require "httparty"
require "json"
require "devrant/api"
require "devrant/rants"
require "devrant/users"

module Devrant

  def structuralize(json)
    JSON.parse(json.body, object_class: OpenStruct)
  end

end
