# app/controllers/dashboards_controller.rb
class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    # @user = current_user
    @user_level = current_user.user_level if current_user.respond_to?(:user_level)
 
    if session[:viewed_quizzes].present?
      @recent_quizzes = Quiz.where(id: session[:viewed_quizzes])
                            .sort_by { |quiz| session[:viewed_quizzes].index(quiz.id) }
    else
      @recent_quizzes = []
    end

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
