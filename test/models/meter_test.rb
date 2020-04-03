require 'test_helper'

class MeterTest < ActiveSupport::TestCase
  def setup
      @user = users(:stephen)
    # This code is not idiomatically correct.
      @meter = @user.meters.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @meter.valid?
  end

  test "user id should be present" do
    @meter.user_id = nil
    assert_not @meter.valid?
  end
    
    test "content should be present" do
    @meter.content = "   "
    assert_not @meter.valid?
  end

  test "content should be at most 140 characters" do
    @meter.content = "a" * 141
    assert_not @meter.valid?
  end
    
test "order should be most recent first" do
    assert_equal meters(:most_recent), Meter.first
  end
end
