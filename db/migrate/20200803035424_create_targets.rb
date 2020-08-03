class CreateTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :targets do |t|
      t.integer :target_category_id
      t.string :content

      t.timestamps
    end
  end
end
