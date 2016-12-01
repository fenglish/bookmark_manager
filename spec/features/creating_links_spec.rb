require 'spec_helper'
require './models/link.rb'
require 'web_helper'

RSpec.feature "BookmarkManager" do
  scenario "Users add new link to the list" do
    sign_in
    visit '/links/new'
    fill_in('url', with: 'www.totallynew.com')
    fill_in('title', with: 'New')
    click_button('Submit')
    expect(page).to have_content("www.totallynew.com")
  end
end
