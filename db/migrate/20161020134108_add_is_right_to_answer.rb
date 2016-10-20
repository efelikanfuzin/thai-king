class AddIsRightToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :is_right, :boolean, default: false
  end
end
