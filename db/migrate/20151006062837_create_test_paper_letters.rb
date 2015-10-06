class CreateTestPaperLetters < ActiveRecord::Migration
  def change
    create_table :test_paper_letters do |t|
      t.references :letter, index: true, foreign_key: true
      t.references :test_paper, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
