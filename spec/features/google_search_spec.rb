require "rails_helper"

Capybara.current_driver = :selenium


RSpec.feature "Search my name in google", :type => :feature do
  scenario "User wants to search my name in google" do
    visit 'https://www.google.com/?gws_rd=ssl'

    fill_in 'lst-ib', with: "Brendan Brown"
    click_button 'Search'

    expect page.has_content?('Brendan Brown')

    # Test breaks because without this because google is sending
    # xpath objects that the test wasn't expecting
    expect page.has_xpath?("/html/body/*")
  end
end
