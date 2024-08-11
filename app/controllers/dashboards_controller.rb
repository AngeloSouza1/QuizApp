class DashboardsController < ApplicationController
  before_action :authenticate_user! # Certifica que o usuário está autenticado antes de acessar o dashboard

  def show
    # Certifica que o usuário está autenticado
    @user_level = current_user.user_level if current_user.respond_to?(:user_level)

    # Busca as respostas mais recentes do usuário atual
        @recent_answers = current_user.answers
        .joins(:question)
        .select('DISTINCT ON (questions.quiz_id) answers.*')
        .order('questions.quiz_id, answers.created_at DESC')
        .limit(5)
    # Busca todos os quizzes disponíveis
    @quizzes = Quiz.all
  end
end
