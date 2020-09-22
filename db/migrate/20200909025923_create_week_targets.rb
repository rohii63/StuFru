class CreateWeekTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :week_targets do |t|
      t.integer :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
