class CreateDaycareDays < ActiveRecord::Migration
  def change
    create_table :daycare_days do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :dog_id
      t.timestamps null: false
    end
  end
end
