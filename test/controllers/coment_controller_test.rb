require "test_helper"

class ComentControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get coment_new_url
    assert_response :success
  end

  test "should get edit" do
    get coment_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get coment_destroy_url
    assert_response :success
  end
end
