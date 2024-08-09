class DashboardsController < ApplicationController
  def show
    @user_level = current_user.user_level
    @recent_answers = current_user.answers.includes(question: :quiz).order(created_at: :desc).limit(5)
    @quizzes = Quiz.all  # Certifique-se de que @quizzes é inicializado
  end
end
