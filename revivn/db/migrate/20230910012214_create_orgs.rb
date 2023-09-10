class CreateOrgs < ActiveRecord::Migration[7.0]
  def change
    create_table :orgs do |t|
      t.string :name
      t.string :address
      t.string :address2
      t.string :city
      t.string :zip
      t.string :state

      t.timestamps
    end
  end
end
