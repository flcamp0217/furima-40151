class CreateShippingInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_infos do |t|
      t.string   :postcode,          null: false
      t.integer  :shipping_area_id,     null: false
      t.string   :city,     null: false
      t.string   :street_address, null: false
      t.string   :building
      t.string   :phone,     null: false
      t.references :purchase,    null: false, foreign_key: true
      t.timestamps
    end
  end
end