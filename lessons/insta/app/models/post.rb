class Post < ApplicationRecord
    mount_uploader :img_name, ImgUploader
    belongs_to :user #у одного поста один user
    has_many :comments#у одного поста много комментариев
    has_many :likes#у одного поста много лайков
    validates :description, presence: true, length: {maximum: 500 }
end
