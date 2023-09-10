class CreatePickups < ActiveRecord::Migration[7.0]
  def change
    create_table :pickups do |t|
      t.integer :user_id
      t.string :org_id
      t.string :integer
      t.datetime :pickup_datetime
      t.string :address
      t.string :address2
      t.string :city
      t.string :zip
      t.string :state

      t.timestamps
    end
  end
end
