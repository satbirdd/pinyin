class TestPaper < ActiveRecord::Base
  has_many :test_paper_letters
  has_many :letters, through: :test_paper_letters

  accepts_nested_attributes_for :letters
end
