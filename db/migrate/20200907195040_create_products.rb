class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :category, null: :false
      t.string :name, null: :false
      t.text :description, null: :false

      t.timestamps
    end
  end
end
