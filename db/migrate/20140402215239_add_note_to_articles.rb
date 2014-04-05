class AddNoteToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :note, :string
  end
end
