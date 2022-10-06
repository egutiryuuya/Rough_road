require "test_helper"

class Public::GameTitlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_game_titles_index_url
    assert_response :success
  end
end
