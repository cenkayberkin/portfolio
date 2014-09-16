require "test_helper"

feature "WelcomePage" do
  scenario "Checking content of welcome page" do
    visit 'http://localhost:3000/'
    page.must_have_content "Welcome"
    page.wont_have_content "No no no"
  end
end
