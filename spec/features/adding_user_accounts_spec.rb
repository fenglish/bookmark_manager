require 'spec_helper'
require './models/link.rb'
require './models/user.rb'
require 'web_helper'

RSpec.feature "BookmarkManager" do
  scenario "User can make account and see their email on index page" do
    sign_in
    # visit '/'
    # fill_in('email', with: 'makers@gmail.com')
    # fill_in('password', with: 'password')
    # click_button('Submit')
    expect(page).to have_content('Welcome! makers@gmail.com')
    users = User.all
    expect(users.count).to eq 1
  end
end
