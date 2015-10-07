class Test < ActiveRecord::Base
  belongs_to :paper

  has_many :items, class_name: 'TestItem'

  delegate :letters, to: :paper
end
