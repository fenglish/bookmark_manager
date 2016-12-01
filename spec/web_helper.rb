
def sign_in
  visit '/'
  fill_in('email', with: 'makers@gmail.com')
  fill_in('password', with: 'password')
  click_button('Submit')
end
