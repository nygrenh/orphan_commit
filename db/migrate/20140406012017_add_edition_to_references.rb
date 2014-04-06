class AddEditionToReferences < ActiveRecord::Migration
  def change
    add_column :references, :edition, :string
  end
end
