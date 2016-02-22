json.array!(@shops) do |shop|
  json.extract! shop, :id, :name, :description, :state, :area_id, :category_id
  json.url shop_url(shop, format: :json)
end
