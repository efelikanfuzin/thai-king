class Question < ApplicationRecord
  has_one :right_answer, class_name: Answer, dependent: :destroy
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers
end
