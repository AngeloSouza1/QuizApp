class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_one :user_level, dependent: :destroy
         has_many :answers, dependent: :destroy
       
         after_create :initialize_user_level
       
         private
       
         def initialize_user_level
           create_user_level(level: 1, points: 0)
         end

end
