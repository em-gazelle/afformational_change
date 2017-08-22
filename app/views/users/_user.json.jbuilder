json.extract! user, :id, :email, :phone, :name, :timezone, :created_at, :updated_at
json.url user_url(user, format: :json)
