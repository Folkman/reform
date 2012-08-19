class Question < ActiveRecord::Base
  belongs_to :form
  has_many :answers

  attr_accessible :value, :arrangement, :format

  default_scope order('arrangement ASC')
end
