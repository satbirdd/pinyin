json.array!(@admin_test_papers) do |admin_test_paper|
  json.extract! admin_test_paper, :id
  json.url admin_test_paper_url(admin_test_paper, format: :json)
end
