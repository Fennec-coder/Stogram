# frozen_string_literal: true

class ChangeLikesToGrade < ActiveRecord::Migration[6.1]
  def change
    rename_table :likes, :grades
    add_column :grades, :positive, :boolean, default: false
  end
end
