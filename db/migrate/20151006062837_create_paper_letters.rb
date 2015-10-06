class CreatePaperLetters < ActiveRecord::Migration
  def change
    create_table :paper_letters do |t|
      t.references :letter, index: true, foreign_key: true
      t.references :paper, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
