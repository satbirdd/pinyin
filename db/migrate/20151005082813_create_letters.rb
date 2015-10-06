class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :category, index: true
      t.string :name, index: true

      t.timestamps null: false
    end
  end
end
