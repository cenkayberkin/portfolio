require 'test_helper'

feature("
  As a site visitor, I want to be able to sign up for an account,
  so that I can perform actions that require me to be logged in.") do
  scenario 'sign up' do
    visit '/users/sign_up'

    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    page.must_have_content 'Welcome'
    page.wont_have_content 'There was a problem with your sign up'
  end

  scenario "sign in with twitter works" do

   # save_and_open_page
   # click_on "Sign In"
   OmniAuth.config.test_mode = true
   OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })

   visit root_path

   Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
   Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]

   click_on "Sign in with Twitter"
   page.must_have_content "Logged in as test_twitter_user"
  end
end
