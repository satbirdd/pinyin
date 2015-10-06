class PaperLetter < ActiveRecord::Base
  belongs_to :paper
  belongs_to :letter
end
