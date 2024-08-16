class Admin::DashboardsController < ApplicationController
  def show
    @ranking = User.joins(:user_level).order('user_levels.points DESC').limit(10)

    @users_progress = User.includes(:user_level).map do |user|
      total_answers = user.answers.count
      correct_answers = user.answers.where(correct: true).count
      incorrect_answers = total_answers - correct_answers
      total_quizzes = user.answers.joins(:question).select('questions.quiz_id').distinct.count
      accuracy_percentage = total_answers > 0 ? (correct_answers.to_f / total_answers * 100).round(2) : 0
      average_correct_per_quiz = total_quizzes > 0 ? (correct_answers.to_f / total_quizzes).round(2) : 0

      # Calcular o melhor quiz
      best_quiz_data = user.answers.where(correct: true)
                                   .joins(:question)
                                   .group('questions.quiz_id')
                                   .order('COUNT(answers.id) DESC')
                                   .limit(1)
                                   .pluck('questions.quiz_id', 'COUNT(answers.id)')

      best_quiz = best_quiz_data.present? ? Quiz.find(best_quiz_data.first[0]) : nil
      best_quiz_score = best_quiz_data.present? ? best_quiz_data.first[1] : 0
      
      {
        user: user,
        correct_answers: correct_answers,
        incorrect_answers: incorrect_answers,
        accuracy_percentage: accuracy_percentage,
        total_quizzes: total_quizzes,
        average_correct_per_quiz: average_correct_per_quiz,
        best_quiz: best_quiz,
        best_quiz_score: best_quiz_score
      }
    end
  end

  def index
    @ranking = User.joins(:user_level)
                   .select('users.*, user_levels.points')
                   .order('user_levels.points DESC')
                   .limit(10) # Mostrando os 10 primeiros colocados
  end
end
