module Devrant
  class Rants
    include HTTParty
    include Devrant    

    attr_accessor :parent

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
      structuralize(self.class.get('/devrant/rants', extend_request(:query, params))).rants 
    end

    def search(term)
      structuralize(self.class.get('/devrant/search', extend_request(:query, {term: term}))).results
    end

    def comment(rant, content, token_id, token_key, user_id)
      structuralize(self.class.post("/devrant/rants/#{rant}/comments", extend_request(:body, {token_id: token_id, token_key: token_key, user_id: user_id, comment: content})))
    end

  end
end

