require 'test_helper'

class Api::Contents::ContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_contents_contents_index_url
    assert_response :success
  end

end
