module Devrant
  class Api
    attr_reader :rants
    
    BASE_URI = 'https://www.devrant.io/api'

    def initialize
      options = {
        query: {
          app: 3
        },
        base_uri: BASE_URI
      }

      @rants = Devrant::Rants.new
      @rants.class.default_options = options
    end
  end
end