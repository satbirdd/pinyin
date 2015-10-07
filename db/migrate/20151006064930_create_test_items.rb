class CreateTestItems < ActiveRecord::Migration
  def change
    create_table :test_items do |t|
      t.integer :time, null: false
      t.references :letter, index: true, foreign_key: true
      t.boolean :get, null: false

      t.timestamps null: false
    end
  end
end
