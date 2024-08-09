# app/controllers/quizzes_controller.rb
class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :answer]

  def index
    @quizzes = Quiz.all
  end

  def show
    @user_level = current_user.user_level
    @recent_answers = current_user.answers.includes(question: :quiz).order(created_at: :desc).limit(5)
    @quizzes = Quiz.all  # ou filtrar quizzes específicos se necessário
    @questions = @quiz.questions.includes(:answers)
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to @quiz, notice: 'Quiz criado com sucesso.'
    else
      render :new
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update(quiz_params)
      redirect_to @quiz, notice: 'Quiz atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to quizzes_path, notice: 'Quiz excluído com sucesso.'
  end

  def answer
    correct_count = 0

    params[:responses].each do |question_id, answer_id|
      question = Question.find(question_id)
      selected_answer = question.answers.find(answer_id)
      
      # Verifique se a resposta selecionada está correta
      if selected_answer.correct?
        correct_count += 1
        # Atualiza a pontuação do usuário
        current_user.user_level.increment!(:points, 10)
      end
    end

    redirect_to quiz_path(@quiz), notice: "#{correct_count} respostas corretas!"
  end


  private

  def quiz_params
    params.require(:quiz).permit(:title, :description)
   end

   def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end
