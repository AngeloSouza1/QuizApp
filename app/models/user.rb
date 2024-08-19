class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one :user_level, dependent: :destroy
  has_many :answers, dependent: :destroy

  after_create :initialize_user_level

  def total_correct_answers
    answers.where(correct: true).count
  end

  def total_incorrect_answers
    answers.where(correct: false).count
  end

  def total_answers
    answers.count
  end

  def accuracy_percentage
    total_answers > 0 ? ((total_correct_answers.to_f / total_answers) * 100).round(2) : 0.0
  end
  

  def total_quizzes_answered
    answers.select('DISTINCT quiz_id').count
  end

  def average_correct_answers_per_quiz
    total_quizzes_answered > 0 ? (total_correct_answers.to_f / total_quizzes_answered).round(2) : 0.0
  end

  def best_quiz
    quiz_id = answers.where(correct: true).group(:quiz_id).order('count_id DESC').count('id').first&.first
    Quiz.find_by(id: quiz_id)
  end

  def best_quiz_score
    return 0 unless best_quiz

    answers.where(quiz_id: best_quiz.id, correct: true).count
  end

  private

  def initialize_user_level
    create_user_level(level: 1, points: 0)
  end
end
