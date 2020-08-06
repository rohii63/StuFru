class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.text :name, null: false
      t.string :icon
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :books, [:user_id, :created_at], unique: true
  end
end
