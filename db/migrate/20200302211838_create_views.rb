class CreateViews < ActiveRecord::Migration[5.2]
  def change
    create_table :views do |t|
      t.integer :user_id
      t.integer :movie_id
      t.boolean :watched, :default => false
      t.timestamps
    end
  end
end
