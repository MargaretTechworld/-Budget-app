class AddRefToItemCategories < ActiveRecord::Migration[7.1]
  def change
    add_reference :item_categories, :item, null: false, foreign_key: true
    add_reference :item_categories, :category, null: false, foreign_key: true
  end
end
