require 'test_helper'

class Api::Lesson::LessonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_lesson_lessons_index_url
    assert_response :success
  end

end
