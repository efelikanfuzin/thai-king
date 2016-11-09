class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.integer :initial_balance, default: 0
      t.integer :balance_after_reset, default: 0

      t.timestamps
    end
  end
end
