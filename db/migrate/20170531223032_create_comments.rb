class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body

      # t.references  :user
      t.references :review, { null: false }
      t.timestamps
    end
  end
end
