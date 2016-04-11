class AddColumnToBattlesTable < ActiveRecord::Migration
  def change
    add_column :battles, :attack_initiator, :integer
  end
end
