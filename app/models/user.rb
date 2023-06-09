class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :create_watchlist
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recommendations, dependent: :destroy
  has_many :favourite_movies, dependent: :destroy
  has_many :movies, through: :favourite_movies
  has_one :watchlist, dependent: :destroy
  has_one_attached :photo
  validates :email, presence: true, uniqueness: true

  def create_watchlist
    Watchlist.create!(user_id: self.id)
  end
end
