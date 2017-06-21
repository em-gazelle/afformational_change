json.extract! customer, :id, :email, :phone, :name, :timezone, :created_at, :updated_at
json.url customer_url(customer, format: :json)
