class CreateTestItems < ActiveRecord::Migration
  def change
    create_table :test_items do |t|
      t.references :paper, index: true, foreign_key: true
      t.integer :time
      t.integer :corrent
      t.integer :wrong

      t.timestamps null: false
    end
  end
end
