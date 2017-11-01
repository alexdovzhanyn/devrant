module Devrant
  class Users
    include HTTParty
    include Devrant

    def get_user(id)
      user = structuralize(self.class.get("/users/#{id}")).profile

      return user unless user.nil?

      raise ArgumentError.new("No user found for id #{id}")
    end
  end
end