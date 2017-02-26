class PopulateSlots < ActiveRecord::Migration
  def change
    (10..18).each do |i|
      Slot.create(start_time: i, end_time: i+1)
    end
  end
end
