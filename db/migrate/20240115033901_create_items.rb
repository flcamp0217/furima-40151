class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name,          null: false
      t.text :item_show,            null: false
      t.integer :category_id,       null: false
      t.integer :quality_id,        null: false
      t.integer :postage_id,        null: false
      t.integer :shipping_area_id,  null: false
      t.integer :delivery_time_id,  null: false
      t.integer :price,             null: false
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
