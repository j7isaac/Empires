class AddColumnsToSoldiers < ActiveRecord::Migration
  def change
    add_column :soldiers, :army_id, :integer
    add_column :soldiers, :cost, :integer
    add_column :soldiers, :health, :integer
    add_column :soldiers, :attack_damage, :integer
    add_column :soldiers, :defense, :integer
    add_column :soldiers, :luck, :integer
  end
end
