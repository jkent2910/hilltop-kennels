class CreateDogsDaycareDaysTable < ActiveRecord::Migration
  def change
    create_table :dogs_daycare_days, id: false do |t|
      t.belongs_to :dogs, index: true
      t.belongs_to :daycare_days, index: true
    end
  end
end
