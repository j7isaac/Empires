class AddNameToArmies < ActiveRecord::Migration
  def change
    add_column :armies, :name, :string
  end
end
