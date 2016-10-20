class Question < ApplicationRecord
  has_one :right_answer, -> { where(is_right: true) }, class_name: Answer,
                                                       dependent: :destroy
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers

  enum status: { moderation: 0, approved: 1 }
end
