class CreateMicroposts < ActiveRecord::Migration[6.0]
  def change
    create_table :microposts do |t|
      t.datetime :studied_at
      t.integer :how_many_studied_hours
      t.integer :how_many_studied_minutes
      t.integer :studied_time_in_minutes
      t.text :content
      t.string :picture
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
