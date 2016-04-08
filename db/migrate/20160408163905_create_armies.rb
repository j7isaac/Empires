class CreateArmies < ActiveRecord::Migration
  def change
    create_table :armies do |t|
      t.integer "infantry"
      t.integer "archers"
      t.integer "knights"
      t.integer "spending_balance", default: 100000
      t.timestamps
    end
  end
end
