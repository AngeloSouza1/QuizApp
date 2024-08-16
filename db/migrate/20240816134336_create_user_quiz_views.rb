class CreateUserQuizViews < ActiveRecord::Migration[7.1]
  def change
    create_table :user_quiz_views do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.datetime :accessed_at

      t.timestamps
    end
  end
end
