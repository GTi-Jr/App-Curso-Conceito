require 'test_helper'

class Api::Subcategories::SubcategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_subcategories_subcategories_index_url
    assert_response :success
  end

end
