class AddPickupStatusToPickups < ActiveRecord::Migration[7.0]
  def change
    add_column :pickups, :pickup_status_id, :integer
  end
end
