class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer     :point, { null: false }
      t.references  :voteable, polymorphic: true, null: false



      t.timestamps

    end
  end
end





# class CreateVotes < ActiveRecord::Migration
#   def change
#     create_table :votes do |t|
#       t.integer     :point, { null: false }
#       t.references  :user, { null: false }
#       t.references  :voteable, polymorphic: true, null: false
#       # t.integer     :voteable_id, { null: false }
#       # t.string      :voteable_type, { null: false }

#       t.timestamps
#     end
#   end
# end
