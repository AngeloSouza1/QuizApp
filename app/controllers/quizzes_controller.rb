# app/controllers/quizzes_controller.rb
class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz, only: [:show, :answer]

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @user_level = current_user.user_level
    @recent_answers = current_user.answers.includes(question: :quiz).order(created_at: :desc).limit(5)
    @questions = @quiz.questions.includes(:answers)
     # Armazenar o ID do quiz na sessão, garantindo que não haja duplicatas
     session[:viewed_quizzes] ||= []
     session[:viewed_quizzes].delete(@quiz.id)  # Remove o quiz se já estiver na lista
     session[:viewed_quizzes].unshift(@quiz.id)  # Adiciona o quiz no início da lista
 
     # Limitar a lista aos últimos 5 quizzes acessados
     session[:viewed_quizzes] = session[:viewed_quizzes].take(5)

  end


def answer
  correct_count = 0

  if params[:responses].present?
    params[:responses].each do |question_id, answer_id|
      question = Question.find(question_id)
      selected_answer = question.answers.find(answer_id)

      # Verifica se já existe uma resposta do usuário para essa pergunta
      user_answer = current_user.answers.find_or_initialize_by(question: question)

      # Atualiza a resposta existente com o novo conteúdo e status
      # user_answer.update(
      #   content: selected_answer.content,
      #   correct: selected_answer.correct
      # )

      # Atualiza a pontuação do usuário, se a resposta estiver correta
      if selected_answer.correct?
        correct_count += 1
        current_user.user_level.increment!(:points, 10)
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
