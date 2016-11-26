class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :inventory
      t.integer :price
      t.belongs_to :category, index: true
    end
    add_foreign_key :items, :categories
  end
end