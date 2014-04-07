class RemoveReferenceIdFromPublisher < ActiveRecord::Migration
  def change
    remove_column :publishers, :reference_id
  end
end
