require 'spec_helper'

RSpec.describe Devrant::Users do
  it "can fetch a single user" do
    devRant = Devrant::Api.new

    expect(devRant.users.get_user(217820).username).to eq('RuntimeError')
  end

  it "raises error when user is not found" do
    devRant = Devrant::Api.new

    expect { devRant.users.get_user(1) }.to raise_error(ArgumentError)
  end
end