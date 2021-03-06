# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :body
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
