module Devrant
  class Rants
    include HTTParty
    include Devrant    

    def all
      structuralize(self.class.get('/devrant/rants')).rants
    end

    def weekly
      structuralize(self.class.get('/devrant/weekly-rants')).rants
    end

    def random
      structuralize(self.class.get('/devrant/rants/surprise')).rant
    end

    def stories
      structuralize(self.class.get('/devrant/story-rants')).rants
    end
    
    def collabs
      structuralize(self.class.get('/devrant/collabs')).rants
    end

    def get_rant(id)
      rant = structuralize(self.class.get("/devrant/rants/#{id}")).rant

      return rant unless rant.nil?

      raise ArgumentError.new("No rant found for id #{id}")
    end

    def get_rants(params={})
      structuralize(self.class.get('/devrant/rants', extend_request_query(params))).rants 
    end

    def search(term)
      structuralize(self.class.get('/devrant/search', extend_request_query({term: term}))).results
    end

  end
end

