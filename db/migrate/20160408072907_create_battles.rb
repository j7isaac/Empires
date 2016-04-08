class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :surviving_army
      t.integer :army_a
      t.integer :army_b
      t.timestamps
    end
    add_index :battles, :army_a
    add_index :battles, :army_b
  end
end
