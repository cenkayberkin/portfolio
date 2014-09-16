require "test_helper"

feature "WelcomePage" do
  scenario "Checking content of welcome page" do
    visit root_path
    page.must_have_content "Welcome"
    page.wont_have_content "No no no"
  end
end
