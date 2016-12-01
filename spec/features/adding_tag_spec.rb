require 'spec_helper'
require './models/link.rb'
require 'database_cleaner'

RSpec.feature "BookmarkManager" do
  scenario "Users add tag to link" do
    DatabaseCleaner.strategy = :truncation
    visit '/links/new'
    fill_in('url', with: 'https://github.com/teamcapybara/capybara')
    fill_in('title', with: 'Capybara')
    fill_in('tag', with: 'test')
    click_button('Submit')

    link = Link.first
    expect(link.tags.map(&:tag_name)).to include('test')
  end
  DatabaseCleaner.clean
end
