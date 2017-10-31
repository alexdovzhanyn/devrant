module Devrant
  class Rants
    include HTTParty
    include Devrant
    
    def get_rants
      structuralize(self.class.get('/devrant/rants')).rants
    end
  end
end

