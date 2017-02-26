class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.string :start_time
      t.string :end_time

      t.timestamps null: false
    end
  end
end
