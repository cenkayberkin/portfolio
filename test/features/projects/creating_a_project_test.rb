require 'test_helper'

feature 'As the site owner, I want to add a portfolio item so that I can show off my work' do
  scenario 'adding a new project' do
    visit '/'
    click_on 'Login'
    fill_in 'Email', with: 'user1@mysite.com'
    fill_in 'Password', with: 'user123'
    click_button 'Log in'
    # save_and_open_page
    visit projects_path

    # save_and_open_page
    click_on 'New Project'
    fill_in 'Name', with: 'Code Fellows Portfolio'
    fill_in 'Technologies used', with: 'Rails, Ruby, Bootstrap, HTML5, CSS3'
    click_on 'Create Project'
    page.text.must_include 'Project has been created'
    assert page.has_css?('.success'), 'Expected a flash notice on this page, none found.'
    page.status_code.must_equal 200
  end

  scenario 'new project has invalid data' do
    visit '/'
    click_on 'Login'
    fill_in 'Email', with: 'user1@mysite.com'
    fill_in 'Password', with: 'user123'
    click_button 'Log in'

    # Given invalid project data is entered in a form
    visit new_project_path

    fill_in 'Name', with: 'Q'
    # When the form is submitted with a short name and missing technologies_used field
    click_on 'Create Project'
    # Then the form should be displayed again, with an error message
    current_path.must_match(/projects$/)
    page.text.must_include 'Project could not be saved'
    page.text.must_include 'Name is too short'
    page.text.must_include "Technologies used can't be blank"
  end
end
