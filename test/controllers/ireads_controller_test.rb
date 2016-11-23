require 'test_helper'

class IreadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @iread = ireads(:one)
  end

  test "should get index" do
    get ireads_url
    assert_response :success
  end

  test "should get new" do
    get new_iread_url
    assert_response :success
  end

  test "should create iread" do
    assert_difference('Iread.count') do
      post ireads_url, params: { iread: { caption: @iread.caption, caption_render: @iread.caption_render } }
    end

    assert_redirected_to iread_url(Iread.last)
  end

  test "should show iread" do
    get iread_url(@iread)
    assert_response :success
  end

  test "should get edit" do
    get edit_iread_url(@iread)
    assert_response :success
  end

  test "should update iread" do
    patch iread_url(@iread), params: { iread: { caption: @iread.caption, caption_render: @iread.caption_render } }
    assert_redirected_to iread_url(@iread)
  end

  test "should destroy iread" do
    assert_difference('Iread.count', -1) do
      delete iread_url(@iread)
    end

    assert_redirected_to ireads_url
  end
end
