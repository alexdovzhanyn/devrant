require 'spec_helper'

RSpec.describe Devrant::Users do
  it "can fetch a single user" do
    devRant = Devrant::Api.new

    expect(devRant.users.get_user_by_id(217820).username).to eq('RuntimeError')
  end

  it "raises error when user is not found" do
    devRant = Devrant::Api.new

    expect { devRant.users.get_user_by_id(1) }.to raise_error(ArgumentError)
  end

  it "can find user id from username" do
    devRant = Devrant::Api.new

    expect(devRant.users.get_user_id('RuntimeError')).to eq(217820)
  end

  it "raises error when no user id is found from username" do
    devRant = Devrant::Api.new
  
    expect { devRant.users.get_user_id('fakeUserThatShouldntExist') }.to raise_error(ArgumentError) 
  end
end
