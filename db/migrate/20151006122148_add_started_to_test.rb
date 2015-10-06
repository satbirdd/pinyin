class AddStartedToTest < ActiveRecord::Migration
  def change
    add_column :tests, :started, :boolean, default: false, null: false
  end
end
