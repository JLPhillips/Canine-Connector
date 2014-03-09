json.array!(@dogs) do |dog|
  json.extract! dog, :id, :name, :breed, :age, :features, :unique_features, :is_lost, :is_found, :has_returned, :hero_id, :date_found, :location
  json.url dog_url(dog, format: :json)
end
