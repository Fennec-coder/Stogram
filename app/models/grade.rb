# frozen_string_literal: true

class Grade < ApplicationRecord
  belongs_to :post
  belongs_to :user
end
