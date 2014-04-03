class AddPublisherToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :publisher, :string
  end
end
