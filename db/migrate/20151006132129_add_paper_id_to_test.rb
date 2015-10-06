class AddPaperIdToTest < ActiveRecord::Migration
  def change
    add_reference :tests, :paper, index: true, foreign_key: true
  end
end
