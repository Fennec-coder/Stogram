# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  EMAIL_FORMAT = /\A[^@]+@([^@.]+\.)+[^@.]+\z/.freeze

  include ImageUploader::Attachment(:avatar)

  has_many :posts, dependent: :delete_all
  has_many :grades, dependent: :delete_all

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: EMAIL_FORMAT, message: "invalid email" }
  validates :username, presence: true
  validates :name, presence: true

  has_many :follower_follows, foreign_key: :being_followed_id, class_name: "Follow"
  has_many :followers, through: :follower_follows, source: :follower

  has_many :following_follows, foreign_key: :follower_id, class_name: "Follow"
  has_many :being_followeds, through: :following_follows, source: :being_followed

  has_many :comments

  scope :subscribed, -> { Follow.where(follower_id: id) }

  def subscribed(being_followed_id)
    Follow.where(follower_id: id, being_followed_id: being_followed_id).take
  end
end
