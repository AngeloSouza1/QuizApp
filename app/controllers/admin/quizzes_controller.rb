# app/controllers/admin/quizzes_controller.rb
class Admin::QuizzesController < ApplicationController
  before_action :authenticate_admin! # Garante que apenas admins acessem essas ações
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to admin_quizzes_path, notice: 'Quiz criado com sucesso.'
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
      redirect_to admin_quizzes_path, notice: 'Quiz atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to admin_quizzes_path, notice: 'Quiz excluído com sucesso.'
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :description, :difficulty)
  end
end
