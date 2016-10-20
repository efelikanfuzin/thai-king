class AddDeviceIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :device_id, :string
    remove_column :users, :balance
    add_column :users, :balance, :integer, default: 0
  end
end
