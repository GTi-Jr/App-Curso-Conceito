require 'test_helper'

class Api::Categories::CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_categories_categories_index_url
    assert_response :success
  end

end
