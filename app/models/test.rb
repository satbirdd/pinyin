class Test < ActiveRecord::Base
  belongs_to :paper

  has_many :items, class_name: 'TestItem'

  def letters
    paper.letters.sample(paper.letters.length)
  end

  def correct_rate
    if !correct.nil? && !wrong.nil? && correct + wrong > 0
      "#{((correct.to_f / (correct + wrong)) * 100).round(0)}%"
    else
      "测试未完成"
    end
  end
end
