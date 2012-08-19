class Form < ActiveRecord::Base
  has_many :questions, dependent: :destroy

  attr_accessible :name, :number_of_questions
  attr_accessor :number_of_questions

  validates :name, presence: true, uniqueness: true
end
