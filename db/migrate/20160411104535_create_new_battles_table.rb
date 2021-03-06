class CreateNewBattlesTable < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer   :army_a
      t.integer  :army_b
      t.integer  :attack_initiator
      t.timestamps
    end
    add_index :battles, :army_a
    add_index :battles, :army_b
  end
end
