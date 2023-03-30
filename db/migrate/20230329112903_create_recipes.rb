class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.integer :hot_level, null: false
      t.integer :time, null: false
      t.timestamps
    end
  end
end
