# app/models/quiz.rb
class Quiz < ApplicationRecord
  has_many :user_quiz_views
  has_many :users, through: :user_quiz_views
  has_many :answers
  has_many :questions, dependent: :destroy
  
  # Monta o uploader para o campo :image
  mount_uploader :image, ImageUploader
  # Callback para remover a imagem associada ao destruir o registro
  before_destroy :remove_image!

  # Validações
  validates :title, presence: true
  
  private

  def remove_image!
    remove_image if image.present?
  end


end
