# app/controllers/admin/quizzes_controller.rb
class Admin::QuizzesController < ApplicationController
  before_action :authenticate_admin! # Garante que apenas admins acessem essas ações
    before_action :set_quiz, only: [:show, :edit, :update, :destroy]
  

    
    
  def update
    if @quiz.update(quiz_params)
      flash[:notice] = "Quiz atualizado com sucesso."
      redirect_to admin_quizzes_path
    else
      render :edit
    end
  end

  def index
    @quizzes = Quiz.order(:title)
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
    params.require(:quiz).permit(:title, :description, :difficulty, :image)
  end
end
