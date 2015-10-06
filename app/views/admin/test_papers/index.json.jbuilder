json.array!(@admin_papers) do |admin_paper|
  json.extract! admin_paper, :id
  json.url admin_paper_url(admin_paper, format: :json)
end
