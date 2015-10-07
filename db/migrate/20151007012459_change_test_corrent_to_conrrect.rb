class ChangeTestCorrentToConrrect < ActiveRecord::Migration
  def change
    rename_column :tests, :corrent, :correct
  end
end
