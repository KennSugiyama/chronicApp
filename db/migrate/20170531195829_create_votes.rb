class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer     :point, { null: false }
      t.references  :voteable, polymorphic: true, null: false
      t.references :user, { null: false }

      t.timestamps
    end
  end
end




