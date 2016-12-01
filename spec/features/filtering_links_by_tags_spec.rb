require 'spec_helper'
require './models/link.rb'

RSpec.feature "BookmarkManager" do
  scenario "Users filter links by tag" do
    visit '/links/new'
    fill_in('url', with: 'https://something')
    fill_in('title', with: 'Something')
    fill_in('tag', with: 'bubbles')
    click_button('Submit')
    visit '/links/new'
    fill_in('url', with: 'https://another')
    fill_in('title', with: 'Another')
    fill_in('tag', with: 'test')
    click_button('Submit')
    visit "/tags/bubbles"
    expect(page).to have_content('Something')
    expect(page).not_to have_content('Another')
  end
end
