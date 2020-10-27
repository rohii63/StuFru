class AddStatusWithBookRefToMicroposts < ActiveRecord::Migration[6.0]
  def change
    add_reference :microposts, :status_with_book, foreign_key: { on_delete: :nullify }
  end
end
