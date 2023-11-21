class CreateItemCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :item_categories do |t|
      
      t.timestamps
    end
  end
end
