class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,    null: false, default: ""
      t.integer    :from_location_id,  null: false, default: 1
      t.string     :city,           null: false, default: ""
      t.string     :house_number,   null: false, default: ""
      t.string     :building_name,  default: ""
      t.string     :phone_number,   null: false, default: ""
      t.references :purchase,     foreign_key: true
      t.timestamps
    end
  end
end
