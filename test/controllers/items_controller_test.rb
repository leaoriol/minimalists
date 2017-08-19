require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @item = items(:one)
    @list = lists(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should create item" do
    # create uses list URL because the creation of the item happens in the list URL 
    assert_difference('Item.count') do
      post list_items_path(@list), params: { item: { action: @item.action, name: @item.name, quantity: @item.quantity, category: @item.category} }
    end
    assert_redirected_to list_path(Item.first.list)
  end


  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item) #, list: @list.id
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { action: @item.action, list_id: @item.list_id, name: @item.name, quantity: @item.quantity } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end

  test "should redirect destroy for wrong list" do 
    #test that if try to delete a micropost from another list when you are on X list, should not work

  end

end
