class TestPaperLetter < ActiveRecord::Base
  belongs_to :test_paper
  belongs_to :letter
end
