class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, length: { minimum: 2, maximum: 20 }, presence:true, uniqueness: true
  validates :introduction, length: { maximum: 50 }

  has_one_attached :profile_image

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end