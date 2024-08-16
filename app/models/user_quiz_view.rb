class UserQuizView < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  validates :accessed_at, presence: true
end
