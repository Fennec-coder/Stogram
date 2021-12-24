# frozen_string_literal: true

class AddAvatarToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :avatar_data, :text
  end
end
