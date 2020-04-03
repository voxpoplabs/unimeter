require 'test_helper'

class MetersInterfaceTest < ActionDispatch::IntegrationTest

  def setup
      @user = users(:stephen)
  end

  test "meter interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Meter.count' do
      post meters_path, params: { meter: { content: "" } }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    content = "This meter really ties the room together"
    assert_difference 'Meter.count', 1 do
      post meters_path, params: { meter: { content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete post
    assert_select 'a', text: 'delete'
    first_meter = @user.meters.paginate(page: 1).first
    assert_difference 'Meter.count', -1 do
      delete meter_path(first_meter)
    end
    # Visit different user (no delete links)
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
end