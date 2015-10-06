json.array!(@paper_letters) do |paper_letter|
  json.extract! paper_letter, :id, :letter, :paper_id
  json.url paper_letter_url(paper_letter, format: :json)
end
