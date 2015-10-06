json.array!(@tests) do |test|
  json.extract! test, :id, :time, :letter_id, :get
  json.url test_url(test, format: :json)
end
