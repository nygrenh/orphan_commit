class AddMonthToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :month, :int
  end
end
