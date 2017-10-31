module Devrant
  module Api
    include HTTParty
    BASE_URI = 'https://www.devrant.io/api'

    def self.extended(base)
      base.include(HTTParty)
      base.default_options = {
        query: {
          app: 3
        },
        base_uri: BASE_URI
      }
    end

    def structuralize(json)
      JSON.parse(json.body, object_class: OpenStruct)
    end
  end
end