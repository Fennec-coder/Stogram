class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  EMAIL_FORMAT = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  has_many :posts, dependent: :delete_all
  has_many :likes, dependent: :delete_all

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: EMAIL_FORMAT, message: 'invalid email' }

  has_many :follower_follows, foreign_key: :being_followed_id, class_name: "Follow"
  has_many :followers, through: :follower_follows, source: :follower

  has_many :following_follows, foreign_key: :follower_id, class_name: "Follow"
  has_many :being_followeds, through: :following_follows, source: :being_followed
end
