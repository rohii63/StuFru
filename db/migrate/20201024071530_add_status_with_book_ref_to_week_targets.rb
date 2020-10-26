class AddStatusWithBookRefToWeekTargets < ActiveRecord::Migration[6.0]
  def change
    add_reference :week_targets, :status_with_book, null: false, foreign_key: true
  end
end
