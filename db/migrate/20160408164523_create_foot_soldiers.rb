class CreateFootSoldiers < ActiveRecord::Migration
  def change
    create_table :foot_soldiers do |t|

      t.timestamps
    end
  end
end
