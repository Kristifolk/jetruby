class User < ApplicationRecord
    has_many :posts #у одного user много постов
    #has_many :friends

    validates :first_name, presence: true, length: {maximum: 100 }
    validates :last_name, presence: true, length: {maximum: 100 }
    validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, length: {maximum: 150 } #регулярка вид емейла
    validates :password, presence: true 
    validates :about_myself, length: {maximum: 250 }
end
