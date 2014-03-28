class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :abbreviation
      t.string :author
      t.string :title
      t.string :journal
      t.integer :volume
      t.integer :number
      t.integer :year
      t.string :pages
      t.string :publisher
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
