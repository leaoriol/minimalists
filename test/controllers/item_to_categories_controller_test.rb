require 'test_helper'

class ItemToCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_to_category = item_to_categories(:one)
    items(:one)
  end

  test "should get index" do
    get item_to_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_item_to_category_url
    assert_response :success
  end

  test "should create item_to_category" do
    assert_difference('ItemToCategory.count') do
      post item_to_categories_url, params: { item_to_category: { category_id: @item_to_category.category_id, item_id: @item_to_category.item_id } }
    end

    assert_redirected_to item_to_category_url(ItemToCategory.last)
  end

  test "should show item_to_category" do
    get item_to_category_url(@item_to_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_to_category_url(@item_to_category)
    assert_response :success
  end

  test "should update item_to_category" do
    patch item_to_category_url(@item_to_category), params: { item_to_category: { category_id: @item_to_category.category_id, item_id: @item_to_category.item_id } }
    assert_redirected_to item_to_category_url(@item_to_category)
  end

  test "should destroy item_to_category" do
    assert_difference('ItemToCategory.count', -1) do
      delete item_to_category_url(@item_to_category)
    end

    assert_redirected_to item_to_categories_url
  end
end
