class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :name
      t.integer :order

      t.timestamps null: false
    end
  end
end
