class AddColumnBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference(:books, :book_category, foreign_key: true)
  end
end
