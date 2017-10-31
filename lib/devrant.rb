require "devrant/version"
require "httparty"
require "json"
require "ostruct"
require "devrant/api"
require "devrant/rants"

module Devrant

  def structuralize(json)
    JSON.parse(json.body, object_class: OpenStruct)
  end

end
