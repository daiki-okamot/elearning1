class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,          presence: true,   length: { maximum: 50 }
  validates :username,      presence: true,   length: { maximum: 50 },   uniqueness: true
  validates :description,   presence: true,   length: { maximum: 1000 }
  
end
