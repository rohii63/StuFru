class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.text :name, null: false
      t.string :icon

      t.timestamps
    end
    add_index :books, :name, unique: true, length: 100
  end
end