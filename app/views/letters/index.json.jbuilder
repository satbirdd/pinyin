json.array!(@letters) do |letter|
  json.extract! letter, :id, :type, :name
  json.url letter_url(letter, format: :json)
end
