class Answer < ActiveRecord::Base
  belongs_to :question
  attr_accessible :username, :value, :date_time

  validates :username, presence: true
end
