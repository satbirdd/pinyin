class AddTestToTestItem < ActiveRecord::Migration
  def change
    add_reference :test_items, :test, index: true, foreign_key: true
  end
end
