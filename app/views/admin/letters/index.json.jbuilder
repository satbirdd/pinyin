json.array!(@admin_letters) do |admin_letter|
  json.extract! admin_letter, :id, :name, :category
  json.url admin_letter_url(admin_letter, format: :json)
end
