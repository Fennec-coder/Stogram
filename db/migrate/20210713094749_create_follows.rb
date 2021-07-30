class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :being_followed_id
    end

    add_foreign_key :follows, :users, column: :follower_id
    add_foreign_key :follows, :users, column: :being_followed_id
  end
end
