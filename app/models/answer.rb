# app/models/answer.rb
class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :question

  validates :content, presence: true
end