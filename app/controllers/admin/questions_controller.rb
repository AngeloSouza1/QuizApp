# app/controllers/admin/questions_controller.rb
class Admin::QuestionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_quiz
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = @quiz.questions
  end

  def show
  end

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.build
    @question.answers.build # Adiciona uma resposta em branco
  end

  def create
    @question = @quiz.questions.build(question_params)
    if @question.save
      redirect_to admin_quiz_questions_path(@quiz), notice: 'Pergunta criada com sucesso.'
    else
      render :new
    end
  end

  def edit
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:id])
    
    # Inicializa pelo menos uma resposta se nenhuma estiver presente
    @question.answers.build if @question.answers.empty?
  end
  
  def update
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:id])
  
    params[:question][:answers_attributes].each do |key, answer_params|
      answer_params[:user_id] = current_admin.id if answer_params[:user_id].blank?
    end if params[:question][:answers_attributes]
  
    if @question.update(question_params)
      redirect_to admin_quiz_path(@quiz), notice: 'Pergunta atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  


  def destroy
    @question.destroy
    redirect_to admin_quiz_questions_path(@quiz), notice: 'Pergunta excluída com sucesso.'
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_question
    @question = @quiz.questions.find(params[:id])
  end

 
def question_params
  params.require(:question).permit(:content, answers_attributes: [:id, :content, :correct, :user_id, :_destroy])
end




end
