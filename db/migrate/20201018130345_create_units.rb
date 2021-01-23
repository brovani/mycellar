class CreateUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :units do |t|
      t.references :place, null: false, foreign_key: true
      t.string :name
      t.string :note
      t.string :rotation
      t.integer :bottles_inside
      t.integer :capacity
      t.integer :depth_number
      t.integer :height_number
      t.integer :width_number
      t.float :post_tax_cost
      t.float :duty
      t.float :vat
      t.float :pre_tax_cost
      t.float :storage_cost
      t.float :transport_cost
      t.float :value_out
      t.string :broker_fee
      t.boolean :mixed
      t.boolean :owc
      t.boolean :oc
      t.date :date_in
      t.date :date_out
      t.string :tax_status

      t.timestamps
    end
  end
end
