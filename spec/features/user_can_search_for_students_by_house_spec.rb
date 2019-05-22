require 'rails_helper'

describe 'as a user' do
  # As a user
  it 'on the homepage I can serch for students by house' do
    visit '/'
    # When I visit "/"
    select "Slytherin", from: 'house'
    # And I select "Slytherin" from the dropdown
    click_button "Get Students"
    # And I click on "Get Students"
    expect(current_path).to eq('/search')
    # Then my path should be "/search" with "house=slytherin" in the parameters
    expect(page).to have_content("22 Students")
    # And I should see a message "22 Students"
    expect(page).to have_css(".student", count: 22)
    # And I should see a list of the 22 members of Slytherin
    within first ".student" do
      expect(page).to have_css(".name")
      expect(page).to have_css(".id")
    end
  end
end
# And I should see a name and id for each student.
