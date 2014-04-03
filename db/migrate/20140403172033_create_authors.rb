class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :reference_author_id

      t.timestamps
    end
  end
end
