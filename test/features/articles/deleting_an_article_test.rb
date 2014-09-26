require "test_helper"

feature "Deleting an Article" do
  scenario "article is deleted with a click" do
    # Given an existing article
    sign_in(:editor)

    Article.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit articles_path

    # When the delete link is clicked
    # save_and_open_page
    page.find('tr:last td a:last',text:"Destroy").click

    # save_and_open_page
    # Then the article is deleted
    page.wont_have_content "Becoming a Code Fellow"
  end
end