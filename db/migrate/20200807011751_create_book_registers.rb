class CreateBookRegisters < ActiveRecord::Migration[6.0]
  def change
    create_table :book_registers do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
    add_index :book_registers, :user_id
    add_index :book_registers, :book_id
    add_index :book_registers, [:user_id, :book_id], unique: true
  end
end
