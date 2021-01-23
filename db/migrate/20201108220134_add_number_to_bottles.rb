class AddNumberToBottles < ActiveRecord::Migration[6.0]
  def change
    add_column :bottles, :number, :integer
  end
end
