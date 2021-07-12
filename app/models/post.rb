class Post < ApplicationRecord
  belongs_to :user
  validates :description, presence: true, length: { maximum: 100 }
  # validates :image, presence: true
  # has_many :likes
  # has_many :comments
  #
  # before_create :come_into_existence
  #
  # def come_into_existence
  #   self.active = true
  #   self.likes_count = 0
  #   self.comments_count = 0
  # end
end
