json.extract! user, :id, :name, :phone, :image, :attachments, :created_at, :updated_at
json.url user_url(user, format: :json)
