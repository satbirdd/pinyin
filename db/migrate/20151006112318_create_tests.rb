class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :time
      t.references :letter, index: true, foreign_key: true
      t.boolean :get

      t.timestamps null: false
    end
  end
end
