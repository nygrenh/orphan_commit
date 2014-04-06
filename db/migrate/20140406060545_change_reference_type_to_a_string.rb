class ChangeReferenceTypeToAString < ActiveRecord::Migration
  def change
  	remove_column :references, :reference_type_id
  	add_column :references, :reference_type, :string
  	drop_table :reference_types
  end
end
