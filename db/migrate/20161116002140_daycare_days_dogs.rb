class DaycareDaysDogs < ActiveRecord::Migration
  def change
    create_table :daycare_days_dogs, id: false do |t|
      t.belongs_to :dogs, index: true
      t.belongs_to :daycare_days, index: true
    end

    drop_table :dogs_daycare_days
  end
end
