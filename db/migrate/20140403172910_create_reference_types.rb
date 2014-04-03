class CreateReferenceTypes < ActiveRecord::Migration
  def change
    create_table :reference_types do |t|
      t.string :name
      t.integer :reference_id

      t.timestamps
    end
  end
end
