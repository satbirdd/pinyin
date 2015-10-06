class AddDescriptionToTestPaper < ActiveRecord::Migration
  def change
    add_column :test_papers, :description, :text
  end
end
