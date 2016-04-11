class AlterColumnsInBattlesTable < ActiveRecord::Migration
  def change
    change_column :battles, :army_a, :integer
    change_column :battles, :army_b, :integer
  end
end
