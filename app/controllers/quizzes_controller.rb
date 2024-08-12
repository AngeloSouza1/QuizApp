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
  
        # Cria uma nova resposta para o usuário
        user_answer = current_user.answers.create(
          question: question,
          content: selected_answer.content,
          correct: selected_answer.correct
        )
  
        if user_answer.persisted?
          correct_count += 1 if selected_answer.correct?
          # Atualiza a pontuação do usuário
          current_user.user_level.increment!(:points, 10) if selected_answer.correct?
        else
          flash[:alert] = "Ocorreu um erro ao salvar suas respostas. Por favor, tente novamente."
          render :show and return
        end
      end
    else
      flash[:alert] = "Nenhuma resposta foi submetida."
      render :show and return
    end
  
    redirect_to quiz_path(@quiz), notice: "#{correct_count} respostas corretas!"
  end
  
  

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end
