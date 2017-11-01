module Devrant
  class Rants
    include HTTParty
    include Devrant

    def all
      structuralize(self.class.get('/devrant/rants')).rants
    end

    def get_rant(id)
      rant = structuralize(self.class.get("/devrant/rants/#{id}")).rant

      return rant unless rant.nil?

      raise ArgumentError.new("No rant found for id #{id}")
    end

  end
end

