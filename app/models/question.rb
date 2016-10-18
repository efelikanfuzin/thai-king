class Question < ApplicationRecord
  has_one :right_answer, class_name: Answer
  has_many :answers

  accepts_nested_attributes_for :answers
end
