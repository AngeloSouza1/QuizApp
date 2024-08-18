class AddQuizIdToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :quiz_id, :integer, null: false
    add_index :answers, :quiz_id
  end
end