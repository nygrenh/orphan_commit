class RemoveColumnsPublisherAddressAndUserId < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.remove :publisher, :address, :user_id
    end
  end
end
