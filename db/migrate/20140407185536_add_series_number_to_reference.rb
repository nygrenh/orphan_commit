class AddSeriesNumberToReference < ActiveRecord::Migration
  def change

	add_column :references, :series_id, :integer
  end
end
