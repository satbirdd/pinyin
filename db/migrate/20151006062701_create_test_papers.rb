class CreateTestPapers < ActiveRecord::Migration
  def change
    create_table :test_papers do |t|
      t.string :name
      t.integer :order

      t.timestamps null: false
    end
  end
end
