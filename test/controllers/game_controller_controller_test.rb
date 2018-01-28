require 'test_helper'

class GameControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get game_controller_index_url
    assert_response :success
  end

  test "should get join" do
    get game_controller_join_url
    assert_response :success
  end

end
