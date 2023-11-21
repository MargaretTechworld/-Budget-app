class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :amount, precision: 10, scale: 2
      t.references :author, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
