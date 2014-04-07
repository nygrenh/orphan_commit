class CreateReferenceEditors < ActiveRecord::Migration
  def change
    create_table :reference_editors do |t|
      t.integer :reference_id
      t.integer :author_id

      t.timestamps
    end
  end
end
