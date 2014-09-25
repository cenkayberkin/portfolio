require "test_helper"

feature "Deleting an Project" do
  scenario "project is deleted with a click" do
    visit "/"
    click_on "Login"
    fill_in "Email", with: "user1@mysite.com"
    fill_in "Password", with: "user123"
    # save_and_open_page

    click_button "Log in"

    project = Project.create(name: "hey this is new project", technologies_used: "ruby rails sqlite")
    visit projects_path
    # puts "a##{project.id}"
    # save_and_open_page

    page.find("a##{project.id}",text:"Destroy").click

    page.wont_have_content "hey this is new project"
  end
end