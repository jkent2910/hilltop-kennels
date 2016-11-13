class AddStartTimeAndEndTimeToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :start_time, :datetime
    add_column :dogs, :end_time, :datetime
  end
end
