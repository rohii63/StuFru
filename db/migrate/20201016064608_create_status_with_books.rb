class CreateStatusWithBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :status_with_books do |t|
      t.string :status
      t.string :study_unit
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.references :book_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
