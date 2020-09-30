class CreateMicroposts < ActiveRecord::Migration[6.0]
  def change
    create_table :microposts do |t|
      t.datetime :studied_at, null: false
      t.integer :how_many_studied_hours, null: false
      t.integer :how_many_studied_minutes, null: false
      t.integer :studied_time_in_minutes, null: false
      t.integer :study_amount
      t.text :content
      t.string :picture
      t.references :user, foreign_key: true, null: false
      t.references :book, foreign_key: true

      t.timestamps
    end
    add_index :microposts, :studied_at
  end
end
