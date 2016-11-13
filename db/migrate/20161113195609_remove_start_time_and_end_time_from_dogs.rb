class RemoveStartTimeAndEndTimeFromDogs < ActiveRecord::Migration
  def change
    remove_column :dogs, :start_time, :datetime
    remove_column :dogs, :end_time, :datetime
  end
end
