# db/seeds.rb
admin = Admin.create(email: 'admin@example.com', password: 'password123', password_confirmation: 'password123')
user = User.create(email: 'user@example.com', password: 'password123', password_confirmation: 'password123')

quiz = Quiz.create(title: 'Capitais do Mundo', description: 'Teste seus conhecimentos sobre capitais.')
question = quiz.questions.create(content: 'Qual é a capital da França?')
question.answers.create(content: 'Paris', correct: true)
question.answers.create(content: 'Londres', correct: false)



puts "BANCO SEED ATUALIZADO!!"