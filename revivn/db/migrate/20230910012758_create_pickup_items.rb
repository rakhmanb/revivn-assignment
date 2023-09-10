class CreatePickupItems < ActiveRecord::Migration[7.0]
  def change
    create_table :pickup_items do |t|
      t.integer :hardware_type_id
      t.integer :quantity
      t.text :description
      t.integer :pickup_id

      t.timestamps
    end
  end
end
