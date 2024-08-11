# app/models/answer.rb

class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :content, presence: true
  validates :user_id, presence: true
end
