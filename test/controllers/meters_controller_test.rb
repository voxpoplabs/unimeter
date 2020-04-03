require 'test_helper'

class MetersControllerTest < ActionDispatch::IntegrationTest

    
  def setup
    @meter = meters(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Meter.count' do
      post meters_path, params: { meter: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Meter.count' do
      delete meter_path(@meter)
    end
    assert_redirected_to login_url
  end
    
test "should redirect destroy for wrong meter" do
    log_in_as(users(:stephen))
    meter = meters(:ants)
    assert_no_difference 'Meter.count' do
      delete meter_path(meter)
    end
    assert_redirected_to root_url
  end

end
