class CreateViews < ActiveRecord::Migration[5.2]
  def change
    create_table :views do |view|
      view.integer :user_id
      view.integer :movie_id
      view.integer :duration
    end
  end
end
