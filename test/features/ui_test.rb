require "test_helper"

class UiTest < Capybara::Rails::TestCase
  test "check if bootstrap included" do
    visit 'http://localhost:3000'
    page.source.must_include "foundation.css"
  end
end
