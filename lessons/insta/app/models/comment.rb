class Comment < ApplicationRecord
    belongs_to :user #у одного комментария один user
    belongs_to :post #у одного комментария свой пост
end
