class AddStatusWithBookRefToMicroposts < ActiveRecord::Migration[6.0]
  def change
    add_reference :microposts, :status_with_book, foreign_key: true
  end
end
