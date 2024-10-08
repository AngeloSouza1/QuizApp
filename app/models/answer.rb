class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user, optional: true
  belongs_to :quiz
  validates :content, presence: true
  validates :correct, inclusion: { in: [true, false] }
end
