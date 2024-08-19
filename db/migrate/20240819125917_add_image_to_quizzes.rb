class AddImageToQuizzes < ActiveRecord::Migration[7.1]
  def change
    add_column :quizzes, :image, :string
  end
end
