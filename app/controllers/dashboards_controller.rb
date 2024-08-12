# class DashboardsController < ApplicationController
#   before_action :authenticate_user! # Certifica que o usuário está autenticado antes de acessar o dashboard

#   def show
#     # Certifica que o usuário está autenticado
#     @user_level = current_user.user_level if current_user.respond_to?(:user_level)

#     @recent_quizzes = Quiz.joins(questions: :answers)
#                           .where(answers: { user_id: current_user.id })
#                           .select('quizzes.*, MAX(answers.updated_at) as last_answered_at')
#                           .group('quizzes.id')
#                           .order('last_answered_at DESC')
#                           .limit(5)

#     # Busca todos os quizzes disponíveis
#     @quizzes = Quiz.all
#   end
# end

# app/controllers/dashboards_controller.rb
class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user_level = current_user.user_level

  # Dados de progresso do usuário logad
    @total_correct_answers = current_user.total_correct_answers
    @total_incorrect_answers = current_user.total_incorrect_answers
    @accuracy_percentage = current_user.accuracy_percentage
    @total_quizzes_answered = current_user.total_quizzes_answered
    @average_correct_answers_per_quiz = current_user.average_correct_answers_per_quiz

    # Últimos quizzes respondidos
    @recent_quizzes = Quiz.joins(questions: :answers)
                          .where(answers: { user_id: current_user.id })
                          .select('quizzes.*, MAX(answers.created_at) as last_answered_at')
                          .group('quizzes.id')
                          .order('last_answered_at DESC')
                          .limit(5)

    # Quizzes disponíveis
    @quizzes = Quiz.all

     # Ranking dos usuários baseado na pontuação total
     @user_ranking = User.joins(:user_level)
     .select('users.*, user_levels.points')
     .order('user_levels.points DESC')
     .limit(10)

     @users = User.joins(:user_level).order('user_levels.points DESC')
  end
end
