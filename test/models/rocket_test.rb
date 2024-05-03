require "test_helper"

class RocketTest < ActiveSupport::TestCase

  fixtures :rockets

  def setup
    @rocket = rockets(:one)
  end

  test "the truth" do
    assert true
  end

  test "name required" do
    @rocket.Name = ""
    assert_not @rocket.save
  end

  test "Price less than zero" do
    @rocket.Price = -1
    assert_not @rocket.save
  end

end
