require "test_helper"

feature "Editing an Article" do
  scenario "submit updates to an existing article" do
    # Given an existing article
    visit "/"
    click_on "Login"
    fill_in "Email", with: "user1@mysite.com"
    fill_in "Password", with: "user123"
    click_button "Log in"

    visit articles_path

    # When I click edit and submit changed data
    # save_and_open_page
    # click_on "Edit"
    id = Article.last.id
    page.find("a##{id}",text:"Edit").click

    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Article"

    # Then the article is updated
    page.text.must_include "Article was successfully updated"
    page.text.must_include "Web Developer"
  end
end