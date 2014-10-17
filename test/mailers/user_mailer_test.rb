require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  def test_welcome_message
    mail = UserMailer.welcome_message
    assert_equal "Welcome message", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
