# app/controllers/admin/questions_controller.rb
class Admin::QuestionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_quiz, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = @quiz.questions
  end

  def show
  end

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.build
    5.times { @question.answers.build } # Sempre cria 5 campos de resposta em branco
  end

  def create
    @question = @quiz.questions.build(question_params)
    @question.answers.each do |answer|
      answer.user_id = current_admin.id
    end
    
    if @question.save
      redirect_to admin_quiz_path(@quiz), notice: 'Pergunta criada com sucesso.'
    else
      render :new
    end
  end

  def edit
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:id])
    (5 - @question.answers.size).times { @question.answers.build } # Adiciona campos de resposta para totalizar 5
  end

  def update
    @question.assign_attributes(question_params)
    @question.answers.each do |answer|
      answer.user_id = current_admin.id if answer.user_id.nil?
    end

    if @question.save
      redirect_to admin_quiz_path(@quiz), notice: 'Pergunta atualizada com sucesso.'
    else
      render :edit
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
