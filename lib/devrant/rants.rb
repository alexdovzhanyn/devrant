module Devrant
  class Rants
    extend Devrant::Api
    include Devrant::Api

    def get_rants
      structuralize(self.class.get('/devrant/rants')).rants
    end
  end
end

