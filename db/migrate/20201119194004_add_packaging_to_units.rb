class AddPackagingToUnits < ActiveRecord::Migration[6.0]
  def change
      add_column :units, :packaging, :boolean
  end
end
