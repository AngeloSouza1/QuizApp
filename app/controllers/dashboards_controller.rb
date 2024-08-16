# app/controllers/dashboards_controller.rb
# class DashboardsController < ApplicationController
#   before_action :authenticate_user!

#   def show
#     # @user = current_user
#     @user_level = current_user.user_level if current_user.respond_to?(:user_level)
 
#     if session[:viewed_quizzes].present?
#       @recent_quizzes = Quiz.where(id: session[:viewed_quizzes])
#                             .sort_by { |quiz| session[:viewed_quizzes].index(quiz.id) }
#     else
#       @recent_quizzes = []
#     end

#     # Quizzes disponíveis
#     @quizzes = Quiz.all

#      # Ranking dos usuários baseado na pontuação total
#      @user_ranking = User.joins(:user_level)
#      .select('users.*, user_levels.points')
#      .order('user_levels.points DESC')
#      .limit(10)

#      @users = User.joins(:user_level).order('user_levels.points DESC')
#   end
# end


# class DashboardsController < ApplicationController
#   before_action :authenticate_user!

#   def show
#     # @user = current_user
#     @user_level = current_user.user_level if current_user.respond_to?(:user_level)
 
#     if session[:viewed_quizzes].present?
#       @recent_quizzes = Quiz.where(id: session[:viewed_quizzes])
#                             .sort_by { |quiz| session[:viewed_quizzes].index(quiz.id) }
#     else
#       @recent_quizzes = []
#     end

#     # Quizzes disponíveis
#     @quizzes = Quiz.all

#     # Ranking dos usuários baseado na pontuação total
#     @user_ranking = User.joins(:user_level)
#                         .select('users.*, user_levels.points')
#                         .order('user_levels.points DESC')
#                         .limit(10)

#     @users = User.joins(:user_level).order('user_levels.points DESC')

#     # Calcular acertos, erros, e outros dados de progresso
#     total_answers = current_user.answers.count
#     correct_answers = current_user.answers.where(correct: true).count
#     incorrect_answers = total_answers - correct_answers
#     total_quizzes = current_user.answers.joins(:question).select('questions.quiz_id').distinct.count

#     @correct_answers = correct_answers
#     @incorrect_answers = incorrect_answers
#     @accuracy_percentage = total_answers > 0 ? (correct_answers.to_f / total_answers * 100).round(2) : 0
#     @total_quizzes = total_quizzes
#     @average_correct_per_quiz = total_quizzes > 0 ? (correct_answers.to_f / total_quizzes).round(2) : 0
#   end
# end


class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user_level = current_user.user_level if current_user.respond_to?(:user_level)

    # Buscar os últimos quizzes acessados pelo usuário usando a nova tabela `user_quiz_views`
    @recent_quizzes = Quiz.joins(:user_quiz_views)
                          .where(user_quiz_views: { user_id: current_user.id })
                          .select('quizzes.*, user_quiz_views.accessed_at')
                          .order('user_quiz_views.accessed_at DESC')
                          .distinct
                          .limit(5)

    # Quizzes disponíveis
    @quizzes = Quiz.all

    # Ranking dos usuários baseado na pontuação total
    @user_ranking = User.joins(:user_level)
                        .select('users.*, user_levels.points')
                        .order('user_levels.points DESC')
                        .limit(10)

    @users = User.joins(:user_level).order('user_levels.points DESC')

    # Calcular acertos, erros, e outros dados de progresso
    total_answers = current_user.answers.count
    correct_answers = current_user.answers.where(correct: true).count
    incorrect_answers = total_answers - correct_answers
    total_quizzes = current_user.answers.joins(:question).select('questions.quiz_id').distinct.count

    @correct_answers = correct_answers
    @incorrect_answers = incorrect_answers
    @accuracy_percentage = total_answers > 0 ? (correct_answers.to_f / total_answers * 100).round(2) : 0
    @total_quizzes = total_quizzes
    @average_correct_per_quiz = total_quizzes > 0 ? (correct_answers.to_f / total_quizzes).round(2) : 0
  end
end
