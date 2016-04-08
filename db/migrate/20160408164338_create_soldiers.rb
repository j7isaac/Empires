class CreateSoldiers < ActiveRecord::Migration
  def change
    create_table :soldiers do |t|

      t.timestamps
    end
  end
end
