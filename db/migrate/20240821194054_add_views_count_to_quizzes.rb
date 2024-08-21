class AddViewsCountToQuizzes < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :views_count, :integer, default: 0, null: false
  end
end
