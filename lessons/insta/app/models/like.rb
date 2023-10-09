class Like < ApplicationRecord
    belongs_to :user #у одного лайка один юзер
    belongs_to :post #у одного лайка один пост
end
