class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.integer :reference_type_id
      t.integer :journal_id
      t.integer :reference_author_id
      t.string :title
      t.integer :year
      t.integer :volume
      t.integer :number
      t.string :pages
      t.integer :month
      t.string :note
      t.string :key
      t.integer :publisher_id
      t.string :address

      t.timestamps
    end
  end
end
