class AddFieldsToUnits < ActiveRecord::Migration[6.0]
  def change
  add_column :units, :fridge, :boolean
  add_column :units, :rack, :boolean
  add_column :units, :bottles_size, :string
  end
end
