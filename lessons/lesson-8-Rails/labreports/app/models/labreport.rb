class Labreport < ApplicationRecord
    belongs_to :user #у одной лабораторной работы один user
    has_one :grade #у одной лабораторной работы одна оценка

    validates :title, presence: true, length: {maximum: 250 }
    validates :description, presence: true, length: {maximum: 500 }
    validates :grade, on: :update, inclusion: { in: ['A', 'B', 'C', 'D', 'E', 'FX', 'F'] }#Grade - Оценка по системе ECTS (A, B, C, D, E, FX, F) 
    
end
