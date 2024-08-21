
class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz, only: [:show, :answer ]
 



  def index
    @quizzes = Quiz.order(:title)
  end

  def show
    @quiz = Quiz.find(params[:id])
    @quiz.increment!(:views_count)
    
    # Registra a visualização do quiz na nova tabela `user_quiz_views`
    UserQuizView.create(user: current_user, quiz: @quiz, accessed_at: Time.current)
    
    @user_level = current_user.user_level
    @recent_answers = current_user.answers.includes(question: :quiz).order(created_at: :desc).limit(5)
    @questions = @quiz.questions.includes(:answers)
    
    if @questions.blank?
      flash[:alert] = "Esse quiz não possui perguntas ainda."
      redirect_to quizzes_path and return
    end
  end

  def answer
    correct_count = 0
  
    if params[:responses].present?
      params[:responses].each do |question_id, answer_id|
        question = Question.find(question_id)
        selected_answer = question.answers.find(answer_id)
  
        # Verifica se já existe uma resposta do usuário para essa pergunta
        user_answer = current_user.answers.find_or_initialize_by(question: question)
  
        # Atualiza o conteúdo da resposta e se está correta
        user_answer.update(content: selected_answer.content, correct: selected_answer.correct)
  
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
