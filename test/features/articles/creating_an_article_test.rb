require 'test_helper'

feature 'Creating an article' do
  scenario 'submit form data to create a new article' do
    # Given a completed new article form
    visit '/'
    click_on 'Login'
    fill_in 'Email', with: 'user1@mysite.com'
    fill_in 'Password', with: 'user123'
    click_button 'Log in'

    visit '/articles/new'
    # save_and_open_page

    fill_in 'Title', with: articles(:cr).title
    fill_in 'Body', with: articles(:cr).body

    # When I submit the form
    click_on 'Create Article'

    # Then a new article should be created and displayed
    page.text.must_include 'Article was successfully created'
    page.text.must_include articles(:cr).title
  end

  scenario 'unauthenticated site visitors cannot visit new_article_path' do
    visit new_article_path
    page.must_have_content 'You need to sign in or sign up before continuing'
  end

  scenario 'unauthenticated site vistiors cannot see new article button' do
    visit articles_path
    # save_and_open_page
    page.wont_have_content 'New Article'
  end

  scenario "authors can't publish" do
    sign_in(:author)
    visit new_article_path
    page.wont_have_field('published')
  end

  scenario 'editors can publish' do
    # Given an editor's account
    sign_in(:editor)

    # When I visit the new page
    visit new_article_path

    # save_and_open_page

    # There is a checkbox for published
    page.must_have_field('Published')

    # When I submit the form
    fill_in 'Title', with: articles(:cr).title
    fill_in 'Body', with: articles(:cr).body
    check 'Published'
    click_on 'Create Article'

    # save_and_open_page

    # Then the published article should be shown
    page.text.must_include 'Status: Published'
  end

end
