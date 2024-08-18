class Admin::ProgressController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users_progress = User.includes(:user_level).map do |user|
      {
        user: user,
        correct_answers: user.total_correct_answers,
        incorrect_answers: user.total_incorrect_answers,
        accuracy_percentage: user.accuracy_percentage,
        total_quizzes: user.total_quizzes_answered,
        average_correct_per_quiz: user.average_correct_answers_per_quiz,
        best_quiz: user.best_quiz,
        best_quiz_score: user.best_quiz_score
      }
    end
  end
end
