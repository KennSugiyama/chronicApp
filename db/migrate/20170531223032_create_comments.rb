class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references  :commentable, polymorphic: true, null: false

      # t.references :review, { null: false }
      t.references :user, { null: false }
      t.timestamps null: false
    end
  end
end
