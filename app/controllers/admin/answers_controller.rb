class Admin::AnswersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_quiz
  before_action :set_question
  before_action :set_answer, only: [:edit, :update, :destroy, :show]

  def show
    unless @answer
      redirect_to admin_quiz_question_path(@quiz, @question), alert: 'Resposta não encontrada.'
    end
  end

  def new
    @answer = @question.answers.build
  end

  def create
    @answer = @question.answers.build(answer_params)
    @answer.user_id = current_admin.id # Atribua o user_id do admin logado
    @answer.quiz_id = @quiz.id # Atribua o quiz_id da pergunta associada
  
    if @answer.save
      redirect_back fallback_location: admin_quiz_question_path(@quiz, @question), notice: 'Resposta criada com sucesso.'
    else
      render :new
    end
  end

  def edit
    # Certificar que existam sempre 5 respostas para edição
    (5 - @question.answers.count).times do
      @question.answers.build(content: "sem resposta ainda", correct: false)
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_quiz_question_path(@quiz, @question), notice: 'Resposta atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_quiz_question_path(@quiz, @question), notice: 'Resposta excluída com sucesso.'
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_question
    @question = @quiz.questions.find(params[:question_id])
  end

  def set_answer
    @answer = @question.answers.find_by(id: params[:id])
  end

  def answer_params
    params.require(:answer).permit(:content, :correct)
  end
end
