class DropBattlesTable < ActiveRecord::Migration
  def change
    drop_table :battles
  end
end
