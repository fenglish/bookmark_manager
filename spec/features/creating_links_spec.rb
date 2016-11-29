require './app/models/link.rb'
require 'spec_helper'

RSpec.feature "BookmarkManager" do
  scenario "Users add new link to the list" do
    Link.create(url: 'http://www.google.com', title: 'Google')
    visit '/links/new'
    click_button('Submit')
    expect(page).to have_content("Google")
  end
end
