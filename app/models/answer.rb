class Answer < ActiveRecord::Base
  belongs_to :question
  attr_accessible :username, :value

  validates :username, presence: true
end
