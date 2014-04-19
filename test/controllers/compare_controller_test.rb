require 'test_helper'

class CompareControllerTest < ActionController::TestCase
  test "should get rating" do
    get :rating
    assert_response :success
  end

end
