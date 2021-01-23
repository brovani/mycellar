class CreateBottles < ActiveRecord::Migration[6.0]
  def change
    create_table :bottles do |t|
      t.references :unit, null: false, foreign_key: true
      t.references :wine, null: false, foreign_key: true
      t.string :name
      t.string :size
      t.string :vintage
      t.integer :depth_position
      t.integer :height_position
      t.integer :width_position
      t.float :post_tax_cost
      t.float :duty
      t.float :vat
      t.float :pre_tax_cost
      t.float :storage_cost
      t.float :transport_cost
      t.float :value_out
      t.date :date_in 
      t.date :date_out
      t.string :tax_status
      t.string :broker_fee

      t.timestamps
    end
  end
end
