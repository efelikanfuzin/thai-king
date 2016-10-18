class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :text
      t.references :right_answer, foreign_key: true

      t.timestamps
    end
  end
end
