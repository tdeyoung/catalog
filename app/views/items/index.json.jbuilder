json.array!(@items) do |item|
  json.extract! item, :id, :title, :composer_name, :arranger, :publisher, :ensemble, :level, :location, :comments
  json.url item_url(item, format: :json)
end
