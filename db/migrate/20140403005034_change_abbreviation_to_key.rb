class ChangeAbbreviationToKey < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.rename :abbreviation, :key
    end
  end
end
