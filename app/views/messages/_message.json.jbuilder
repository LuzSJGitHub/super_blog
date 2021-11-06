json.extract! message, :id, :post_id, :user_id, :author, :message, :created_at, :updated_at
json.url message_url(message, format: :json)
