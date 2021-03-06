require "spec_helper"

RSpec.describe Devrant::Rants do
  it "can fetch a list of rants" do
    devRant = Devrant::Api.new
    expect(devRant.rants.all).not_to be_empty
  end

  it "can fetch a specific rant" do
    devRant = Devrant::Api.new
    expect(devRant.rants.get_rant(950909).id).to eq(950909)
  end

  it "throws error when rant is not found" do
    devRant = Devrant::Api.new
    expect { devRant.rants.get_rant(1) }.to raise_error(ArgumentError)
  end

  it "can filter rants" do 
    devRant = Devrant::Api.new
    expect(devRant.rants.get_rants({limit: 3}).length).to eq(3)
  end

  it "can fetch a random rant" do
    devRant = Devrant::Api.new
    expect(devRant.rants.random.id).not_to eq(nil)
  end

  it "can fetch weekly rants" do
    devRant = Devrant::Api.new
    expect(devRant.rants.weekly).not_to be_empty
  end

  it "can fetch stories" do
    devRant = Devrant::Api.new
    expect(devRant.rants.stories).not_to be_empty
  end

  it "can fetch collabs" do
    devRant = Devrant::Api.new
    expect(devRant.rants.collabs).not_to be_empty
  end

  it "can search rants" do
    devRant = Devrant::Api.new
    expect(devRant.rants.search('wtf')).not_to be_empty
  end

end
