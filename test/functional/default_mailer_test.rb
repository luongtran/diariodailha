require 'test_helper'

class DefaultMailerTest < ActionMailer::TestCase
  test "alert_admin" do
    mail = DefaultMailer.alert_admin
    assert_equal "Alert admin", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "finish_sale" do
    mail = DefaultMailer.finish_sale
    assert_equal "Finish sale", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "alert_photographer" do
    mail = DefaultMailer.alert_photographer
    assert_equal "Alert photographer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
