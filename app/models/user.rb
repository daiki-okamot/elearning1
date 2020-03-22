class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :movies, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name,          presence: true,   length: { maximum: 50 }
  validates :username,      presence: true,   length: { maximum: 50 },   uniqueness: true
  validates :description,   presence: true,   length: { maximum: 1000 }
  
end
