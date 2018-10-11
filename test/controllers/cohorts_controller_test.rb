require 'test_helper'

class CohortsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cohorts_index_url
    assert_response :success
  end

  test "should get new" do
    get cohorts_new_url
    assert_response :success
  end

  test "should get create" do
    get cohorts_create_url
    assert_response :success
  end

  test "should get show" do
    get cohorts_show_url
    assert_response :success
  end

  test "should get edit" do
    get cohorts_edit_url
    assert_response :success
  end

  test "should get update" do
    get cohorts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get cohorts_destroy_url
    assert_response :success
  end

end
