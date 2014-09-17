require "test_helper"

feature "Deleting an Article" do
  scenario "article is deleted with a click" do
    # Given an existing article
    Article.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit articles_path

    # When the delete link is clicked
    click_on "Destroy"

    # Then the article is deleted
    page.wont_have_content "Becoming a Code Fellow"
  end
end