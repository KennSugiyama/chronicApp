class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.string :year
      t.string :actors
      t.string :director

      t.timestamps
    end
  end
end
