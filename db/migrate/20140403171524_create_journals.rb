class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :name
      t.integer :reference_id

      t.timestamps
    end
  end
end
