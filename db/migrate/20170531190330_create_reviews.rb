class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :body

      t.references  :movie, { null: false }
      t.references  :user, { null: false }
      t.timestamps null: false
    end
  end
end
