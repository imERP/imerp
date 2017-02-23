require 'test_helper'

class Api::V1::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_product = api_v1_products(:one)
  end

  test "should get index" do
    get api_v1_products_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_product_url
    assert_response :success
  end

  test "should create api_v1_product" do
    assert_difference('Api::V1::Product.count') do
      post api_v1_products_url, params: { api_v1_product: { can_sale: @api_v1_product.can_sale, code: @api_v1_product.code, cost: @api_v1_product.cost, explanation: @api_v1_product.explanation, name: @api_v1_product.name, pattern: @api_v1_product.pattern, price: @api_v1_product.price, sales: @api_v1_product.sales, sales_amount: @api_v1_product.sales_amount, standard: @api_v1_product.standard, use: @api_v1_product.use, user_id: @api_v1_product.user_id } }
    end

    assert_redirected_to api_v1_product_url(Api::V1::Product.last)
  end

  test "should show api_v1_product" do
    get api_v1_product_url(@api_v1_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_product_url(@api_v1_product)
    assert_response :success
  end

  test "should update api_v1_product" do
    patch api_v1_product_url(@api_v1_product), params: { api_v1_product: { can_sale: @api_v1_product.can_sale, code: @api_v1_product.code, cost: @api_v1_product.cost, explanation: @api_v1_product.explanation, name: @api_v1_product.name, pattern: @api_v1_product.pattern, price: @api_v1_product.price, sales: @api_v1_product.sales, sales_amount: @api_v1_product.sales_amount, standard: @api_v1_product.standard, use: @api_v1_product.use, user_id: @api_v1_product.user_id } }
    assert_redirected_to api_v1_product_url(@api_v1_product)
  end

  test "should destroy api_v1_product" do
    assert_difference('Api::V1::Product.count', -1) do
      delete api_v1_product_url(@api_v1_product)
    end

    assert_redirected_to api_v1_products_url
  end
end
