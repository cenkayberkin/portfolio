require 'test_helper'

feature 'WelcomePage' do
  scenario 'Checking content of welcome page' do
    visit '/'
    click_on 'Login'
    fill_in 'Email', with: 'user1@mysite.com'
    fill_in 'Password', with: 'user123'
    click_button 'Log in'

    visit '/'
    page.must_have_content 'Welcome'
    page.wont_have_content 'No no no'
  end
end
