class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :following_id
    end

    add_foreign_key :follows, :users, column: :follower_id
    add_foreign_key :follows, :users, column: :following_id
  end
end
