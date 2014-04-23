class CreateReferenceTags < ActiveRecord::Migration
  def change
    create_table :reference_tags do |t|
      t.integer :reference_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
