class CreateMicroposts < ActiveRecord::Migration[6.0]
  def change
    create_table :microposts do |t|
      t.datetime :studied_at, null: false
      t.integer :studied_time, null: false
      t.integer :studied_page
      t.text :content
      t.string :picture
      t.references :user, null: false, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
