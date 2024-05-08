require "test_helper"

class UserTest < ActiveSupport::TestCase
  fixtures :users

  def setup
    @user = users(:one) # Load the fixture data for user 'one'
    @user.password = "password"
  end



  test "valid user should be valid" do
    assert @user.valid?, @user.errors.full_messages.join(", ")
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.save
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present" do
    @user.password = " "
    assert_not @user.valid?
  end

  test "email should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "should be saved in downcase" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  def teardown
    User.destroy_all
  end

end

