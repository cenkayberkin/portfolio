require "test_helper"

feature "Visiting the Article Index" do
  scenario "with existing posts" do

    # Given created article
    Article.create(title:"Becoming a Code Fellow",
      body:"means strive for excellence")

    # When I visit '/articles'
    visit 'http://localhost:3000/articles'

    # Then the existing article should be displayed
    page.must_have_content "Becoming a Code Fellow"
  end
end