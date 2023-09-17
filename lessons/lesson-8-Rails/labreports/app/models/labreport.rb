class Labreport < ApplicationRecord
    belongs_to :user, foreign_key: :user_id#у одной лабораторной работы один user
    
    validates :title, presence: true, length: {maximum: 250 }
    validates :description, presence: true, length: {maximum: 500 }
    validates :grade, inclusion: { in: ['A', 'B', 'C', 'D', 'E', 'FX', 'F'] }#Grade - Оценка по системе ECTS (A, B, C, D, E, FX, F) 
    #проверить Grade
end
