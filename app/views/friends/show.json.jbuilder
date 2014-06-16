json.array!(@menurecords) do |menu|
  json.extract! menu, :id, :name, :color_tag
  json.date menu.date.strftime("%Y/%m/%d")
end
