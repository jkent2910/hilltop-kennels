class CreateNavigationItems < ActiveRecord::Migration
  def change
    create_table :navigation_items do |t|
      t.string :title
      t.integer :list_order

      t.timestamps null: false
    end
  end
end
