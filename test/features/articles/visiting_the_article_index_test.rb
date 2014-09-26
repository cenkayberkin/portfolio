require 'test_helper'

feature 'Visiting the Article Index' do
  scenario 'with existing posts' do
    visit '/'
    sign_in(:editor)

    # save_and_open_page
    # Given created article
    Article.create(title: 'Becoming a Code Fellow',
                   body: 'means strive for excellence')
    # save_and_open_page
    # When I visit '/articles'
    visit articles_path
    # save_and_open_page

    # Then the existing article should be displayed
    page.must_have_content 'Becoming a Code Fellow'
  end
end
