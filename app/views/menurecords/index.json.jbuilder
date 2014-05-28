json.array!(@menurecords) do |menurecord|
  json.extract! menurecord, :id, :parent_id, :name, :color_tag, :date
  json.url menurecord_url(menurecord, format: :json)
end
