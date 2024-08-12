class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_one :user_level, dependent: :destroy
         has_many :answers, dependent: :destroy
       
         after_create :initialize_user_level
       
        
         def total_correct_answers
          answers.where(correct: true).count
        end
      
        def total_incorrect_answers
          answers.where(correct: false).count
        end
      
        def total_answers
          answers.count
        end
      
        def accuracy_percentage
          (total_correct_answers.to_f / total_answers) * 100
        end
      
        def total_quizzes_answered
          answers.select('DISTINCT question_id').count
        end
      
        def average_correct_answers_per_quiz
          total_quizzes_answered > 0 ? (total_correct_answers.to_f / total_quizzes_answered) : 0
        end


         private
       
         def initialize_user_level
           create_user_level(level: 1, points: 0)
         end

end
