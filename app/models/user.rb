class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :gouttes, dependent: :destroy

  validates :name,
    presence: true,
    uniqueness: { case_sensitive: :false },
    length: { minimum: 2, maximum: 15 }
  validates :email, presence: true
end
