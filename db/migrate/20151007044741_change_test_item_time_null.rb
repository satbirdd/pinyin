class ChangeTestItemTimeNull < ActiveRecord::Migration
  def change
    change_column :test_items, :time, :integer, null: true
  end
end
