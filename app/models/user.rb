class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recommendations
  has_many :favourite_movies
  has_many :movies, through: :favourite_movies
  has_one_attached :photo
end
