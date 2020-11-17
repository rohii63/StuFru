class CreateMicroposts < ActiveRecord::Migration[6.0]
  def change
    create_table :microposts do |t|
      t.datetime :studied_at, null: false
      t.integer :study_hours
      t.integer :study_minutes
      t.integer :study_time, null: false
      t.integer :study_amount
      t.string :study_unit
      t.text :content
      t.string :picture
      t.references :user, foreign_key: true, null: false
      t.references :book, foreign_key: true

      t.timestamps
    end
    add_index :microposts, :studied_at
  end
end
