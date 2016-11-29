
require 'link'
require 'spec_helper'

RSpec.feature "BookmarkManager" do
  scenario "Users see a list of links from database" do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
