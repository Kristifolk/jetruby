=begin
#lesson-8-rails по вашей нумерации ДЗ Урок 7 (Ruby on Rails)

Реализовать web приложение на базе ruby on rails, которое позволит создавать пользовательские (можно принять за студентов) отчеты лабораторных работ и ставить им оценки. Пользователей можно предсоздать из консоли приложения (rails c), либо реализовать отдельный интерфейс для их создания, но пока это не обязательно.
Lab report
Title - обязателен, длина не должна превышать больше 250 символов
Description - длина не должна превышать больше 500 символов
Grade - Оценка по системе ECTS (A, B, C, D, E, FX, F)
User
First name - обязателен, длина не должна превышать больше 100 символов
Last name - обязателен, длина не должна превышать больше 100 символов
Email - обязателен, длина не должна превышать больше 150 символов, должен соответствовать формату email
Мокапы: https://www.figma.com/file/2bzDJsJcNDG9ejVFWRgzVH/
=end

class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments
  
    validates :title, presence: true, length: { maximum: 254 }
    validates :body, presence: true
  
    def formatted_created_at
      created_at.strftime(&quot;%m/%d/%Y&quot;)
    end
  end
  
