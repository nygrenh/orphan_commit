class RemoveReferenceIdFromJournals < ActiveRecord::Migration
  def change
    remove_column :journals, :reference_id, :integer
  end
end
