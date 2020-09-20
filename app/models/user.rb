class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name, length: { in: 1..16 }
    validates :email, format: { with: /@.+/ }, uniqueness: true
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze }, on: :create
  end

  has_one_attached :image
  has_many :plans, foreign_key: :user_id, dependent: :destroy
  has_many :logs, foreign_key: :user_id, dependent: :destroy
end
