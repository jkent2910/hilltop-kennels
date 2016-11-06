class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.integer :navigation_item_id

      t.timestamps null: false
    end
  end
end
