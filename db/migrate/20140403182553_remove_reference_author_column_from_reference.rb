class RemoveReferenceAuthorColumnFromReference < ActiveRecord::Migration
  def change
    remove_column :references, :reference_author_id
  end
end
