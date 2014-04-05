class CreateReferenceAuthors < ActiveRecord::Migration
  def change
    create_table :reference_authors do |t|
      t.integer :author_id
      t.integer :reference_id

      t.timestamps
    end
  end
end
