# app/models/quiz.rb
class Quiz < ApplicationRecord
  has_many :user_quiz_views
  has_many :users, through: :user_quiz_views

 
 
  has_many :questions, dependent: :destroy
  validates :title, presence: true
end
