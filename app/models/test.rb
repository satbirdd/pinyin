class Test < ActiveRecord::Base
  belongs_to :paper

  delegate :letters, to: :paper
end
