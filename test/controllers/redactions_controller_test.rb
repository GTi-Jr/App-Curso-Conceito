require 'test_helper'

class RedactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @redaction = redactions(:one)
  end

  test "should get index" do
    get redactions_url
    assert_response :success
  end

  test "should get new" do
    get new_redaction_url
    assert_response :success
  end

  test "should create redaction" do
    assert_difference('Redaction.count') do
      post redactions_url, params: { redaction: { picture: @redaction.picture, whoreceive: @redaction.whoreceive } }
    end

    assert_redirected_to redaction_url(Redaction.last)
  end

  test "should show redaction" do
    get redaction_url(@redaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_redaction_url(@redaction)
    assert_response :success
  end

  test "should update redaction" do
    patch redaction_url(@redaction), params: { redaction: { picture: @redaction.picture, whoreceive: @redaction.whoreceive } }
    assert_redirected_to redaction_url(@redaction)
  end

  test "should destroy redaction" do
    assert_difference('Redaction.count', -1) do
      delete redaction_url(@redaction)
    end

    assert_redirected_to redactions_url
  end
end
