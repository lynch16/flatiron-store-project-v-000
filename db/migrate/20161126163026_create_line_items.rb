class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :item, index: true
      t.belongs_to :cart, index: true
      t.integer :quantity, default: 1
    end
    add_foreign_key :line_items, :items
    add_foreign_key :line_items, :carts
  end
end
