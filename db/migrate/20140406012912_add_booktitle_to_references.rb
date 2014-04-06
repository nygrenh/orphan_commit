class AddBooktitleToReferences < ActiveRecord::Migration
  def change
    add_column :references, :booktitle, :string
  end
end
