module Devrant
  class Users
    include HTTParty
    include Devrant

    attr_accessor :parent

    def get_user_by_id(id)
      user = structuralize(self.class.get("/users/#{id}")).profile

      return user unless user.nil?

      raise ArgumentError.new("No user found for id #{id}")
    end

    def get_user_id(username)
      id = structuralize(self.class.get('/get-user-id', extend_request(:query, {username: username}))).user_id

      return id unless id.nil?

      raise ArgumentError.new("No user called #{username} found.")
    end
    
    def authenticate(username, password)
      auth_token = structuralize(self.class.post("/users/auth-token", extend_request(:body, {username: username, password: password}))).auth_token

      return auth_token unless auth_token.nil?

      raise ArgumentError.new("Could not authenticate user #{username}")
    end
  end
end
