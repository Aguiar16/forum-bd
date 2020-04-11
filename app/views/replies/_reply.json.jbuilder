json.extract! reply, :id, :body, :post_id, :user_id, :created_at, :updated_at
json.url reply_url(reply, format: :json)
