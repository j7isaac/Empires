class CreateArchers < ActiveRecord::Migration
  def change
    create_table :archers do |t|

      t.timestamps
    end
  end
end
