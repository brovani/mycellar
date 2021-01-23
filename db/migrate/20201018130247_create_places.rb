class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :account_number
      t.string :address
      t.float :longitude
      t.float :latitude
      t.string :website
      t.string :login
      t.string :password
      t.boolean :professional
      t.string :warehouse_number

      t.timestamps
    end
  end
end
