class Post < ApplicationRecord
    belongs_to :user #у одного поста один user
    #has_many :comments#у одного поста много комментариев
    #has_many :likes#у одного поста много лайков

    validates :img_name, presence: true
    validates :description, presence: true, length: {maximum: 500 }
end
