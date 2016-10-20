class AddPassedQuestionToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :passed_questions, :text, array: true, default: []
  end
end
