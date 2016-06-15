json.array!(@districts) do |district|
  json.extract! district, :id, :title, :contact_person, :contact_phone, :contact_email
  json.url district_url(district, format: :json)
end
