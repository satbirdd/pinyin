json.array!(@test_paper_letters) do |test_paper_letter|
  json.extract! test_paper_letter, :id, :letter, :test_paper_id
  json.url test_paper_letter_url(test_paper_letter, format: :json)
end
