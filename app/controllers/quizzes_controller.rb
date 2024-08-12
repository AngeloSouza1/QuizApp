# app/controllers/quizzes_controller.rb
class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :answer]

  def index
    @quizzes = Quiz.all
  end

  def show
    @user_level = current_user.user_level
    @recent_answers = current_user.answers.includes(question: :quiz).order(created_at: :desc).limit(5)
    @questions = @quiz.questions.includes(:answers)
  end

  def answer
    correct_count = 0
  
    if params[:responses].present?
      params[:responses].each do |question_id, answer_id|
        question = Question.find(question_id)
        selected_answer = question.answers.find(answer_id)
  
        # Atualiza a pontuação do usuário
        if selected_answer.correct?
          correct_count += 1
          current_user.user_level.increment!(:points, 10)
        end
      end
  
      flash[:notice] = "Resposta enviada com sucesso!"
      redirect_to quiz_path(@quiz)
    else
      flash[:alert] = "Nenhuma resposta foi submetida."
      render :show
    end
  end
  

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end
