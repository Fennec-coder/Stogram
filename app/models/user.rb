class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  EMAIL_FORMAT = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  has_many :posts

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: EMAIL_FORMAT, message: 'invalid email' }


end
