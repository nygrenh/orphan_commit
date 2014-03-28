json.array!(@articles) do |article|
  json.extract! article, :id, :abbreviation, :author, :title, :journal, :volume, :number, :year, :pages, :publisher, :address, :user_id
  json.url article_url(article, format: :json)
end
