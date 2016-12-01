require 'spec_helper'
require './models/link.rb'
require 'web_helper'

RSpec.feature "BookmarkManager" do
  scenario "User can add multiple tags to a link" do
    sign_in
    visit 'links/new'
    fill_in('url', with: 'https://makersacademy.com')
    fill_in('title', with: 'Makers Academy')
    fill_in('tag', with: 'education coding')
    click_button('Submit')

    link = Link.first
    expect(link.tags.map(&:tag_name)).to include('education', 'coding')
  end
end
