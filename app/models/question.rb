# app/models/question.rb
class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true, reject_if: :all_blank
  # validates :content, presence: true
end