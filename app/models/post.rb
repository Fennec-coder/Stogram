class Post < ApplicationRecord
  belongs_to :user
  validates :description, length: { maximum: 100 }
  validates :image_data, presence: true

  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all

  include ImageUploader::Attachment(:image) # adds an `image` virtual attribute
end
