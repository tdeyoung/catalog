json.array!(@items) do |item|
  json.extract! item, :id, :title, :composer_fname, :composer_lname, :arranger, :publisher, :ensemble, :level, :location, :comments
  json.url item_url(item, format: :json)
end
