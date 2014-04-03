class RemoveReferenceAuthorColumnFromAuthor < ActiveRecord::Migration
  def change
    remove_column :authors, :reference_author_id
  end
end
