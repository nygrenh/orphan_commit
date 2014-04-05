json.array!(@articles) do |article|
  json.extract! article, :id, :key, :author, :title, :journal, :volume, :number, :year, :pages, :month, :note
  json.url article_url(article, format: :json)
end
