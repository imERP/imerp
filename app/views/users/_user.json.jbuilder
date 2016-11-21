json.extract! user, :id, :code, :phone, :username, :email, :name, :avatar, :bio, :sex, :state, :remark, :created_at, :updated_at
json.url user_url(user, format: :json)