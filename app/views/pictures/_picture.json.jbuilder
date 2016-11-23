json.extract! picture, :id, :iread_id, :file, :url, :created_at, :updated_at
json.url picture_url(picture, format: :json)