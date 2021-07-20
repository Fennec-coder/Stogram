class Post < ApplicationRecord
  belongs_to :user

  include ImageUploader::Attachment(:image) # adds an `image` virtual attribute

  validates :description, presence: true, length: { maximum: 100 }
  validates :image, presence: true

  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all

end
