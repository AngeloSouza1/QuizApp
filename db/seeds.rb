# db/seeds.rb
 
# Destrói todos os dados anteriores para evitar duplicação
Quiz.destroy_all
Question.destroy_all
Answer.destroy_all


admin = Admin.create(email: 'admin@example.com', password: 'password123', password_confirmation: 'password123')
user = User.create(email: 'user@example.com', password: 'password123', password_confirmation: 'password123')

puts "admin e user criados!"

# Questões e Respostas para cada quiz

# Criação do quiz "Tecnologia Atual"
tecnologia_quiz = Quiz.create(
  title: 'Tecnologia Atual',
  description: 'Teste seus conhecimentos sobre as últimas tendências tecnológicas.'
)

# Questões e Respostas para o quiz "Tecnologia Atual"
questions = [
  { content: "Qual é a tecnologia de comunicação sem fio que está revolucionando a indústria automobilística?" },
  { content: "Qual tecnologia está no centro da criação de moedas digitais, como o Bitcoin?" },
  { content: "Qual é o impacto das redes 5G na conectividade global?" },
  { content: "Qual empresa lançou recentemente óculos de realidade aumentada focados em produtividade?" },
  { content: "Qual linguagem de programação se tornou a mais popular entre desenvolvedores em 2023?" },
  { content: "Qual tecnologia está ajudando a reduzir o consumo de energia em data centers?" },
  { content: "Qual é o principal desafio para a adoção massiva de veículos elétricos?" },
  { content: "Qual empresa está liderando a corrida na criação de computadores quânticos acessíveis?" },
  { content: "Qual dispositivo wearable foi eleito o melhor de 2023?" },
  { content: "Qual tecnologia de bateria promete ser a solução para o armazenamento de energia renovável?" }
]

answers = [
  ["5G", "Wi-Fi 6", "Bluetooth 5.0", "NFC", "LoRaWAN"],
  ["Blockchain", "Inteligência Artificial", "Cloud Computing", "IoT", "5G"],
  ["Velocidade ultra-rápida", "Maior latência", "Menor consumo de energia", "Menos segurança", "Cobertura global"],
  ["Apple", "Google", "Microsoft", "Amazon", "Facebook"],
  ["Python", "JavaScript", "C#", "Java", "Go"],
  ["AI para otimização", "Cooling líquido", "Uso de energias renováveis", "Data centers submersos", "Armazenamento SSD"],
  ["Infraestrutura de carregamento", "Custo das baterias", "Autonomia limitada", "Tempo de recarga", "Falta de incentivos"],
  ["Google", "IBM", "Intel", "Microsoft", "Alibaba"],
  ["Apple Watch Series 8", "Fitbit Charge 5", "Oura Ring", "Samsung Galaxy Watch 5", "Garmin Fenix 7"],
  ["Baterias de estado sólido", "Lítio-enxofre", "Baterias de hidrogênio", "Ultracapacitores", "Baterias de grafeno"]
]

questions.each_with_index do |question_data, i|
  question = tecnologia_quiz.questions.create!(content: question_data[:content])
  answers[i].each_with_index do |answer_content, j|
    question.answers.create!(content: answer_content, correct: j == 0, user_id: 1) # Certifique-se de que o user_id existe
  end
end

puts "Banco de dados populado com o quiz 'Tecnologia Atual', perguntas e respostas!"


# Criação do quiz "Inteligência Artificial"
ia_quiz = Quiz.create(
  title: 'Inteligência Artificial',
  description: 'Teste seus conhecimentos sobre Inteligência Artificial e suas aplicações.'
)

# Questões e Respostas para o quiz "Inteligência Artificial"
ia_questions = [
  { content: "Qual é o algoritmo de aprendizado de máquina mais comumente usado para classificação?" },
  { content: "Qual é a principal vantagem das redes neurais convolucionais (CNNs)?" },
  { content: "Qual técnica de IA é usada para gerar texto, como em GPT?" },
  { content: "Qual é o nome da técnica usada para treinar IA com feedback positivo e negativo?" },
  { content: "Qual é o termo para IA que pode realizar qualquer tarefa humana?" },
  { content: "Qual é a principal aplicação de algoritmos de clustering?" },
  { content: "Qual framework é amplamente utilizado para desenvolvimento de IA?" },
  { content: "Qual é a técnica usada para reduzir a dimensionalidade dos dados?" },
  { content: "Qual é o maior desafio na criação de IA ética?" },
  { content: "Qual técnica de IA está no centro do reconhecimento de voz?" }
]

ia_answers = [
  ["SVM (Support Vector Machine)", "KNN (K-Nearest Neighbors)", "Random Forest", "Naive Bayes", "Logistic Regression"],
  ["Detecção automática de padrões em imagens", "Velocidade de processamento", "Capacidade de operar sem supervisão", "Maior precisão em dados estruturados", "Facilidade de implementação"],
  ["Redes neurais recorrentes (RNN)", "Transformers", "Redes Bayesianas", "Aprendizado profundo", "Métodos de Ensemble"],
  ["Aprendizado por Reforço", "Aprendizado Supervisionado", "Aprendizado Não Supervisionado", "Transfer Learning", "Aprendizado Semi-supervisionado"],
  ["Inteligência Artificial Geral (AGI)", "Inteligência Artificial Forte", "Inteligência Artificial Fraca", "Inteligência Artificial Específica", "Inteligência Artificial Cognitiva"],
  ["Segmentação de clientes", "Predição de séries temporais", "Análise de sentimentos", "Classificação de documentos", "Filtragem de spam"],
  ["TensorFlow", "Django", "Flask", "Ruby on Rails", "Laravel"],
  ["Análise de Componentes Principais (PCA)", "Regressão Linear", "Árvores de Decisão", "Gradient Boosting", "Matriz de Confusão"],
  ["Bias e discriminação nos algoritmos", "Escalabilidade", "Treinamento de modelos grandes", "Falta de dados", "Hardware especializado"],
  ["Modelos de Markov", "Deep Learning", "Processamento de Linguagem Natural (NLP)", "K-means clustering", "Redes Bayesianas"]
]

ia_questions.each_with_index do |question_data, i|
  question = ia_quiz.questions.create!(content: question_data[:content])
  ia_answers[i].each_with_index do |answer_content, j|
    question.answers.create!(content: answer_content, correct: j == 0, user_id: 1) # Certifique-se de que o user_id existe
  end
end

puts "Banco de dados populado com o quiz 'Inteligência Artificial', perguntas e respostas!"

# Criação do quiz "Ruby on Rails"
rails_quiz = Quiz.create(
  title: 'Ruby on Rails',
  description: 'Teste seus conhecimentos sobre o framework Ruby on Rails.'
)

# Questões e Respostas para o quiz "Ruby on Rails"
rails_questions = [
  { content: "Qual comando é utilizado para criar um novo projeto Rails?" },
  { content: "Qual é o padrão de arquitetura utilizado pelo Rails?" },
  { content: "Qual é o arquivo principal de configuração de rotas no Rails?" },
  { content: "Qual comando é usado para executar as migrações no Rails?" },
  { content: "Qual é a função do Active Record no Rails?" },
  { content: "Qual comando gera um scaffold no Rails?" },
  { content: "Em que diretório os arquivos de visualização (views) são armazenados?" },
  { content: "Qual é o método de callback usado para ações antes de salvar um registro?" },
  { content: "Como você define uma relação muitos-para-muitos no Rails?" },
  { content: "Qual é a principal ferramenta de testes automatizados usada no Rails?" }
]

rails_answers = [
  ["rails new", "rails create", "rails generate", "rails start", "rails init"],
  ["MVC (Model-View-Controller)", "MVVM (Model-View-ViewModel)", "Layered Architecture", "Monolithic", "RESTful Architecture"],
  ["config/routes.rb", "config/application.rb", "app/controllers/application_controller.rb", "app/views/layouts/application.html.erb", "config/database.yml"],
  ["rails db:migrate", "rails db:create", "rails db:setup", "rails migrate", "rails run:migrations"],
  ["Gerenciar a comunicação entre modelos e o banco de dados", "Renderizar as views", "Configurar as rotas", "Gerenciar arquivos estáticos", "Configurar o ambiente de desenvolvimento"],
  ["rails generate scaffold", "rails scaffold create", "rails new scaffold", "rails create scaffold", "rails generate controller"],
  ["app/views", "app/controllers", "app/models", "config/routes", "lib/assets"],
  ["before_save", "before_action", "after_save", "before_update", "before_destroy"],
  ["has_and_belongs_to_many", "belongs_to_many", "has_many :through", "has_many_and_belongs_to_many", "has_many"],
  ["RSpec", "JUnit", "Minitest", "TestUnit", "Capybara"]
]

rails_questions.each_with_index do |question_data, i|
  question = rails_quiz.questions.create!(content: question_data[:content])
  rails_answers[i].each_with_index do |answer_content, j|
    question.answers.create!(content: answer_content, correct: j == 0, user_id: 1) # Certifique-se de que o user_id existe
  end
end

puts "Banco de dados populado com o quiz 'Ruby on Rails', perguntas e respostas!"


# Criação do quiz "Java"
java_quiz = Quiz.create(
  title: 'Java',
  description: 'Teste seus conhecimentos sobre a linguagem de programação Java.'
)

# Questões e Respostas para o quiz "Java"
java_questions = [
  { content: "Qual é o compilador padrão usado para compilar programas em Java?" },
  { content: "Qual é o método principal de entrada em um programa Java?" },
  { content: "O que significa JVM?" },
  { content: "Qual é a palavra-chave usada para herança em Java?" },
  { content: "Qual das seguintes é uma Interface de Coleção no Java?" },
  { content: "Qual é o pacote raiz de todas as classes em Java?" },
  { content: "O que é um construtor em Java?" },
  { content: "Qual das seguintes é uma exceção verificada em Java?" },
  { content: "Como você declara uma constante em Java?" },
  { content: "Qual é o tamanho de um tipo de dado int em Java?" }
]

java_answers = [
  ["javac", "java", "jvm", "javadoc", "jar"],
  ["public static void main(String[] args)", "public void main(String[] args)", "public static String main(String args)", "static public void main()", "void main(String args[])"],
  ["Java Virtual Machine", "Java Variable Method", "Java Vendor Module", "Java Volatile Memory", "Java Version Manager"],
  ["extends", "implements", "inherits", "super", "this"],
  ["List", "Array", "Collection", "Map", "Stream"],
  ["java.lang", "java.util", "java.io", "java.net", "java.awt"],
  ["Um método especial que inicializa um objeto", "Uma variável que armazena dados", "Um bloco de código que trata exceções", "Um método que retorna um valor", "Um tipo de loop em Java"],
  ["IOException", "NullPointerException", "ArithmeticException", "ArrayIndexOutOfBoundsException", "ClassCastException"],
  ["final", "constant", "static", "const", "immutable"],
  ["32 bits", "16 bits", "64 bits", "8 bits", "128 bits"]
]

java_questions.each_with_index do |question_data, i|
  question = java_quiz.questions.create!(content: question_data[:content])
  java_answers[i].each_with_index do |answer_content, j|
    question.answers.create!(content: answer_content, correct: j == 0, user_id: 1) # Certifique-se de que o user_id existe
  end
end

puts "Banco de dados populado com o quiz 'Java', perguntas e respostas!"

# Criação do quiz "Algoritmos"
algorithms_quiz = Quiz.create(
  title: 'Algoritmos',
  description: 'Teste seus conhecimentos sobre algoritmos e estruturas de dados.'
)

# Questões e Respostas para o quiz "Algoritmos"
algorithms_questions = [
  { content: "Qual é a complexidade de tempo do algoritmo de busca binária?" },
  { content: "Qual é o pior caso para o algoritmo de ordenação por seleção?" },
  { content: "O que é uma árvore binária?" },
  { content: "Qual das seguintes estruturas de dados utiliza o conceito de FIFO (First In, First Out)?" },
  { content: "Qual é a principal característica de um algoritmo guloso?" },
  { content: "O que é a recursão em um algoritmo?" },
  { content: "Qual é a principal diferença entre uma pilha e uma fila?" },
  { content: "Qual algoritmo de ordenação tem uma complexidade de tempo média de O(n log n)?" },
  { content: "Qual das seguintes estruturas de dados é usada em uma pesquisa de largura em primeiro lugar (BFS)?" },
  { content: "O que é um grafo acíclico?" }
]

algorithms_answers = [
  ["O(log n)", "O(n)", "O(n log n)", "O(1)", "O(n^2)"],
  ["O(n^2)", "O(n)", "O(log n)", "O(n log n)", "O(1)"],
  ["Uma estrutura de dados onde cada nó tem no máximo dois filhos", "Um tipo de gráfico", "Uma lista encadeada", "Um conjunto de nós desconectados", "Uma estrutura onde todos os nós têm exatamente três filhos"],
  ["Fila", "Pilha", "Árvore", "Grafo", "Lista Duplamente Encadeada"],
  ["Toma a melhor decisão localmente em cada etapa", "Sempre encontra a solução ótima global", "É lento mas seguro", "Depende de técnicas de backtracking", "Funciona apenas para problemas simples"],
  ["Um método onde a função chama a si mesma", "Uma técnica para dividir e conquistar", "Uma forma de iteração", "Um algoritmo de ordenação", "Uma técnica para armazenar dados"],
  ["Uma pilha é LIFO (Last In, First Out) e uma fila é FIFO (First In, First Out)", "Uma fila é LIFO e uma pilha é FIFO", "Ambas seguem FIFO", "Ambas seguem LIFO", "Uma usa grafos e a outra listas"],
  ["Merge Sort", "Bubble Sort", "Selection Sort", "Insertion Sort", "Quick Sort"],
  ["Fila", "Pilha", "Árvore Binária", "Tabela Hash", "Conjunto"],
  ["Um grafo que não possui ciclos", "Um grafo onde todos os nós estão conectados", "Um grafo com apenas um nó", "Um grafo bidimensional", "Um grafo onde cada nó tem um ciclo"]
]

algorithms_questions.each_with_index do |question_data, i|
  question = algorithms_quiz.questions.create!(content: question_data[:content])
  algorithms_answers[i].each_with_index do |answer_content, j|
    question.answers.create!(content: answer_content, correct: j == 0, user_id: 1) # Certifique-se de que o user_id existe
  end
end

puts "Banco de dados populado com o quiz 'Algoritmos', perguntas e respostas!"



