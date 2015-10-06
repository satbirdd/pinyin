json.array!(@papers) do |paper|
  json.extract! paper, :id, :name, :order
  json.url paper_url(paper, format: :json)
end
