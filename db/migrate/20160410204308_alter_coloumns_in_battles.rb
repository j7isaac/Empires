class AlterColoumnsInBattles < ActiveRecord::Migration
  def change
    change_column :battles, :army_a, :string
    change_column :battles, :army_b, :string
  end
end
