class AddOrganizationNumberToReference < ActiveRecord::Migration
  def change

	add_column :references, :organization_id, :integer
  end
end
