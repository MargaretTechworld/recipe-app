require 'test_helper'

class RecipeFoodsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get recipe_foods_new_url
    assert_response :success
  end

  test 'should get create' do
    get recipe_foods_create_url
    assert_response :success
  end

  test 'should get show' do
    get recipe_foods_show_url
    assert_response :success
  end

  test 'should get modify' do
    get recipe_foods_modify_url
    assert_response :success
  end

  test 'should get destroy' do
    get recipe_foods_destroy_url
    assert_response :success
  end
end
