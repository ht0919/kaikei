json.array!(@kamokus) do |kamoku|
  json.extract! kamoku, :id, :name
  json.url kamoku_url(kamoku, format: :json)
end
