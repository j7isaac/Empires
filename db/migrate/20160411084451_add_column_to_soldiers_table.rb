class AddColumnToSoldiersTable < ActiveRecord::Migration
  def change
    add_column :soldiers, :type, :string
  end
end
