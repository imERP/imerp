json.extract! api_v1_product, :id, :code, :name, :standard, :pattern, :cost, :price, :use, :explanation, :can_sale, :sales, :sales_amount, :user_id, :created_at, :updated_at
json.url api_v1_product_url(api_v1_product, format: :json)