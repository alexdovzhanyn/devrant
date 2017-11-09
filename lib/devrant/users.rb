module Devrant
  class Users
    include HTTParty
    include Devrant

    def get_user_by_id(id)
      user = structuralize(self.class.get("/users/#{id}")).profile

      return user unless user.nil?

      raise ArgumentError.new("No user found for id #{id}")
    end

    def get_user_id(username)
      id = structuralize(self.class.get('/get-user-id', extend_request_query({username: username}))).user_id

      return id unless id.nil?

      raise ArgumentError.new("No user called #{username} found.")
    end
  end
end
