class Admin::QuestionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_quiz
  before_action :set_question, only: [:edit, :update, :destroy, :show]
  
  def show
    @question = Question.includes(:answers).find(params[:id])
  end
  


  def new
    @question = @quiz.questions.build
  end

  def create
    @question = @quiz.questions.build(question_params)

    if @question.save
      # Criar respostas padrão associadas ao quiz e à pergunta recém-criada
      5.times do
        @question.answers.create!(
          content: "sem resposta ainda", 
          correct: false, 
          user_id: current_admin.id, 
          quiz_id: @quiz.id
        )
      end
      
      redirect_to admin_quiz_question_path(@quiz, @question), notice: 'Pergunta criada com sucesso.'
    else
      render :new
    end
  end

  def edit
    # Lógica de edição
  end

  def update
    if @question.update(question_params)
      redirect_to admin_quiz_path(@quiz), notice: 'Pergunta atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_quiz_path(@quiz), notice: 'Pergunta excluída com sucesso.'
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_question
    @question = @quiz.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, answers_attributes: [:id, :content, :correct, :user_id, :quiz_id, :_destroy])
  end
end
