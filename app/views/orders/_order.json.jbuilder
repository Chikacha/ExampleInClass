json.extract! order, :id, :name, :phone, :description, :created_at, :updated_at
json.url order_url(order, format: :json)