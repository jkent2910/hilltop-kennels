class RemoveDogIdFromDaycareDays < ActiveRecord::Migration
  def change
    remove_column :daycare_days, :dog_id
  end
end
