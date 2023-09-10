class UpdatePickupColumnToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :pickups, :org_id, "integer USING CAST(org_id AS integer)"
  end
end
