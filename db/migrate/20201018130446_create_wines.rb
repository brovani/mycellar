class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.references :producer, null: false, foreign_key: true
      t.string :name
      t.string :nickname
      t.string :color
      t.string :type
      t.string :lwin
      t.float :longitude
      t.float :latitude
      t.string :country
      t.string :region
      t.string :subregion

      t.timestamps
    end
  end
end
