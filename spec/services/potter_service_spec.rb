require 'rails_helper'

describe "potter_service" do
  it "get_characters_by_house returns all characters in that house" do
    characters = PotterService.new.get_characters_by_house("Gryffindor")

    expect(characters.class).to eq(Array)
    expect(characters.first.class).to eq(Hash)
    expect(characters.first[:name].class).to eq(String)
    expect(characters.count).to eq(41)
  end
end
