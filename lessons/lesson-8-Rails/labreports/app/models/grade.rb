class Grade < ApplicationRecord
    belongs_to :labreports #у одной оценки одна лабораторная работа
end
