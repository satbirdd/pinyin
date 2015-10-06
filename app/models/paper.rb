class Paper < ActiveRecord::Base
  has_many :paper_letters
  has_many :letters, through: :paper_letters

  has_many :tests

  accepts_nested_attributes_for :letters
end
