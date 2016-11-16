class ChangeDateFormat < ActiveRecord::Migration
  def change
    change_column :daycare_days, :start_time, :date
    change_column :daycare_days, :end_time, :date
  end
end
