# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  include ImageUploader::Attachment(:image)

  validates :description, presence: true, length: { maximum: 100 }
  validates :image, presence: true

  has_many :comments, dependent: :delete_all
  has_many :grades, dependent: :delete_all
end
