class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :quiz
  belongs_to :user, optional: true
  
  # validates :content, presence: true
  # validates :user_id, presence: true
end
