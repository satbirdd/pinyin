class Test < ActiveRecord::Base
  belongs_to :paper

  has_many :items, class_name: 'TestItem'

  delegate :letters, to: :paper

  def correct_rate
    if correct + wrong > 0
      "#{((correct.to_f / (correct + wrong)) * 100).round(0)}%"
    else
      "测试未完成"
    end
  end
end
