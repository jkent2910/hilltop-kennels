class RenameIdFieldsJoinTable < ActiveRecord::Migration
  def change
    rename_column :daycare_days_dogs, :dogs_id, :dog_id
    rename_column :daycare_days_dogs, :daycare_days_id, :daycare_day_id
  end
end
