require './app/models/link.rb'
require 'spec_helper'
require 'database_cleaner'

RSpec.feature "BookmarkManager" do
  scenario "Users add new link to the list" do
    DatabaseCleaner.strategy = :truncation
    visit '/links/new'
    fill_in('url', with: 'www.totallynew.com')
    fill_in('title', with: 'New')
    click_button('Submit')
    expect(page).to have_content("www.totallynew.com")
    DatabaseCleaner.clean
  end
end
