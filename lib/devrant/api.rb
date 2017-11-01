module Devrant
  class Api
    HTTP_OPTIONS = {
      query: {
        app: 3
      },
      base_uri: 'https://www.devrant.io/api'
    } 

    def initialize
      subclasses = {
        rants: Devrant::Rants,
        users: Devrant::Users
      }

      initialize_subclasses(subclasses)
    end

    private

    def initialize_subclasses(classes)
      classes.each do |variable, classname|
        self.instance_variable_set("@#{variable}", classname.new)
        self.instance_variable_get("@#{variable}").class.default_options = HTTP_OPTIONS
        self.singleton_class.class_eval do
          attr_reader variable.to_sym
        end
      end
    end
  end
end