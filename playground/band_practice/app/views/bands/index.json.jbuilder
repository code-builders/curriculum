json.array!(@bands) do |band|
  json.extract! band, :id, :name, :genre
  json.url band_url(band, format: :json)
end
