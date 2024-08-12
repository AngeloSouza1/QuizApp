class DashboardsController < ApplicationController
  before_action :authenticate_user! # Certifica que o usuário está autenticado antes de acessar o dashboard

  def show
    # Certifica que o usuário está autenticado
    @user_level = current_user.user_level if current_user.respond_to?(:user_level)

    @recent_quizzes = Quiz.joins(questions: :answers)
                          .where(answers: { user_id: current_user.id })
                          .select('quizzes.*, MAX(answers.updated_at) as last_answered_at')
                          .group('quizzes.id')
                          .order('last_answered_at DESC')
                          .limit(5)

    # Busca todos os quizzes disponíveis
    @quizzes = Quiz.all
  end
end
