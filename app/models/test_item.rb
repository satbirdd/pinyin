class TestItem < ActiveRecord::Base
  belongs_to :test

  belongs_to :letter

  validates :test, presence: true
  validates :letter, presence: true
  validates :get, inclusion: { in: [true, false] }
end
