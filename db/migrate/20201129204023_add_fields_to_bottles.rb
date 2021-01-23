class AddFieldsToBottles < ActiveRecord::Migration[6.0]
  def change
      add_column :bottles, :half_bottle, :boolean
      add_column :bottles, :bottle, :boolean
      add_column :bottles, :magnum, :boolean
      add_column :bottles, :double_magnum, :boolean
  end
end
