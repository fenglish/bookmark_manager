require 'spec_helper'
require './models/link.rb'
require 'database_cleaner'

RSpec.feature "BookmarkManager" do
  scenario "Users add tag to link" do
    visit '/links/new'
    fill_in('url', with: 'https://github.com/teamcapybara/capybara')
    fill_in('title', with: 'Capybara')
    fill_in('tag', with: 'test')
    click_button('Submit')
    expect(page).to have_content('test')
  end
end
