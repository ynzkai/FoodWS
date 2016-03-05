require 'test_helper'

class Admin::ManageControllerTest < ActionController::TestCase
  test "should get check" do
    get :check
    assert_response :success
  end

end
