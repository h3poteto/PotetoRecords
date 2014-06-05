json.array!(@menurecords) do |menu|
  json.extract! menu, :id, :name, :color_tag, :date
  json.created_at menu.created_at.strftime("%Y/%m/%d")
end
