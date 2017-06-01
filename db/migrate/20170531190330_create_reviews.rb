class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :body
      # t.integer :vote_score
      # t.references  :user
      t.references  :movie, { null: false }
      t.timestamps
    end
  end
end
