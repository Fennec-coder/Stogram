class Post < ApplicationRecord
  belongs_to :user
  validates :description, presence: true, length: { maximum: 100 }

  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all

  include ImageUploader::Attachment(:image) # adds an `image` virtual attribute
end
