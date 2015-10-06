class Letter < ActiveRecord::Base
  CATEGORIES = %w(单韵母 复韵母 前鼻韵母 后鼻韵母 声母 整体认读 组合拼音)

  has_many :paper_letters
  has_many :papers, through: :paper_letters
end
