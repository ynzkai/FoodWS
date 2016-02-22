json.array!(@foods) do |food|
  json.extract! food, :id, :name, :description, :state
  json.url food_url(food, format: :json)
end
