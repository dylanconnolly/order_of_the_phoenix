require 'rails_helper'

RSpec.describe "as a user" do
  it "when a house is selected from the dropdown, the user sees a list of members for that house" do

    visit '/'

    select "Gryffindor", from: :house

    click_on "Search For Members"

    expect(current_path).to eq(search_path)

    expect(page).to have_content("Total Members: 21")

    expect(page).to have_css('.order-member', count: 21)

    within(first('.order-member')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.role')
      expect(page).to have_css('.house')
      expect(page).to have_css('.patronus')
    end
  end
end
