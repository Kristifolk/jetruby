class User < ApplicationRecord
    has_many :posts #у одного user много постов
    has_many :likes #у одного user много лайков
    has_many :comments #у одного user много комментариев
    has_many :friends #у одного user много друзей
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
