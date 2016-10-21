class CreateUpdates < ActiveRecord::Migration[5.0]
  def change
    create_table :updates do |t|
      t.integer :last_update, default: 0
      t.string :model
    end
  end
end
