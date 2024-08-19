# db/seeds.rb

# Destrói todos os dados anteriores para evitar duplicação
Quiz.destroy_all
Question.destroy_all
Answer.destroy_all
User.destroy_all
Admin.destroy_all

admin = Admin.create(email: 'admin@example.com', password: 'password123', password_confirmation: 'password123')
user = User.create(email: 'user@example.com', password: 'password123', password_confirmation: 'password123')

puts "Admin e user criados!"

# Função para criar um quiz, perguntas e respostas
def create_quiz_with_questions(title, description, questions_and_answers)
  quiz = Quiz.create!(title: title, description: description)
  
  questions_and_answers.each do |question_data|
    question = quiz.questions.create!(content: question_data[:content])
    
    question_data[:answers].each_with_index do |answer_content, index|
      question.answers.create!(
        content: answer_content,
        correct: index == 0,
        user_id: 1,  # Certifique-se de que o user_id existe
        quiz_id: quiz.id  # Atribuindo o quiz_id corretamente
      )
    end
  end

  puts "Quiz '#{quiz.title}' criado com sucesso!"
end

# Definição dos quizzes e perguntas/respostas
quizzes_data = [
  {
    title: 'Algoritmos',
    description: 'Teste seus conhecimentos sobre algoritmos e estruturas de dados.',
    questions_and_answers: [
      { content: "Qual é a complexidade de tempo do algoritmo de busca binária?", answers: ["O(log n)", "O(n)", "O(n log n)", "O(1)", "O(n^2)"] },
      { content: "Qual é o pior caso para o algoritmo de ordenação por seleção?", answers: ["O(n^2)", "O(n)", "O(log n)", "O(n log n)", "O(1)"] },
      { content: "O que é uma árvore binária?", answers: ["Uma estrutura de dados onde cada nó tem no máximo dois filhos", "Um tipo de gráfico", "Uma lista encadeada", "Um conjunto de nós desconectados", "Uma estrutura onde todos os nós têm exatamente três filhos"] },
      { content: "Qual das seguintes estruturas de dados utiliza o conceito de FIFO (First In, First Out)?", answers: ["Fila", "Pilha", "Árvore", "Grafo", "Lista Duplamente Encadeada"] },
      { content: "Qual é a principal característica de um algoritmo guloso?", answers: ["Toma a melhor decisão localmente em cada etapa", "Sempre encontra a solução ótima global", "É lento mas seguro", "Depende de técnicas de backtracking", "Funciona apenas para problemas simples"] },
      { content: "O que é a recursão em um algoritmo?", answers: ["Um método onde a função chama a si mesma", "Uma técnica para dividir e conquistar", "Uma forma de iteração", "Um algoritmo de ordenação", "Uma técnica para armazenar dados"] },
      { content: "Qual é a principal diferença entre uma pilha e uma fila?", answers: ["Uma pilha é LIFO (Last In, First Out) e uma fila é FIFO (First In, First Out)", "Uma fila é LIFO e uma pilha é FIFO", "Ambas seguem FIFO", "Ambas seguem LIFO", "Uma usa grafos e a outra listas"] },
      { content: "Qual algoritmo de ordenação tem uma complexidade de tempo média de O(n log n)?", answers: ["Merge Sort", "Bubble Sort", "Selection Sort", "Insertion Sort", "Quick Sort"] },
      { content: "Qual das seguintes estruturas de dados é usada em uma pesquisa de largura em primeiro lugar (BFS)?", answers: ["Fila", "Pilha", "Árvore Binária", "Tabela Hash", "Conjunto"] },
      { content: "O que é um grafo acíclico?", answers: ["Um grafo que não possui ciclos", "Um grafo onde todos os nós estão conectados", "Um grafo com apenas um nó", "Um grafo bidimensional", "Um grafo onde cada nó tem um ciclo"] }
    ]
  },
  {
    title: 'Desenvolvimento WEB',
    description: 'Teste seus conhecimentos sobre desenvolvimento web.',
    questions_and_answers: [
      { content: "Qual é a função do HTML?", answers: ["Estruturar o conteúdo da página", "Estilizar a página", "Adicionar interatividade à página", "Gerenciar o banco de dados", "Controlar o servidor web"] },
      { content: "O que significa CSS?", answers: ["Cascading Style Sheets", "Computer Style Sheets", "Creative Style Sheets", "Colorful Style Sheets", "Complex Style Sheets"] },
      { content: "Qual é o principal protocolo usado para comunicação na web?", answers: ["HTTP", "FTP", "SMTP", "SSH", "IMAP"] },
      { content: "O que é JavaScript?", answers: ["Uma linguagem de programação", "Uma biblioteca CSS", "Uma ferramenta de design", "Um servidor web", "Um framework de banco de dados"] },
      { content: "Qual é a principal diferença entre HTML e XML?", answers: ["HTML é para exibição de dados, XML é para transporte de dados", "HTML é case-sensitive, XML não é", "XML não permite aninhamento, HTML permite", "HTML é utilizado em aplicações desktop", "XML é uma linguagem de estilo"] }
    ]
  },
  {
    title: 'Desenvolvimento de Aplicativos Móveis',
    description: 'Teste seus conhecimentos sobre desenvolvimento de aplicativos móveis.',
    questions_and_answers: [
      { content: "Qual é a linguagem de programação principal para Android?", answers: ["Java", "Swift", "Kotlin", "Objective-C", "C#"] },
      { content: "Qual é a linguagem de programação principal para iOS?", answers: ["Swift", "Java", "Kotlin", "Objective-C", "C#"] },
      { content: "Qual framework é amplamente utilizado para desenvolvimento de aplicativos híbridos?", answers: ["Flutter", "Django", "Ruby on Rails", "React", "Spring"] },
      { content: "O que é a App Store?", answers: ["Uma plataforma para distribuir aplicativos iOS", "Uma loja de aplicativos Android", "Uma ferramenta de desenvolvimento de apps", "Um sistema de gerenciamento de APIs", "Um serviço de computação em nuvem"] },
      { content: "O que é o Google Play?", answers: ["Uma plataforma para distribuir aplicativos Android", "Um editor de texto", "Um servidor web", "Um framework para desenvolvimento mobile", "Uma ferramenta de design"] }
    ]
  },
  {
    title: 'Redes de Computadores',
    description: 'Teste seus conhecimentos sobre redes de computadores.',
    questions_and_answers: [
      { content: "O que significa IP?", answers: ["Internet Protocol", "Internet Package", "Internal Protocol", "Information Protocol", "Integrated Protocol"] },
      { content: "Qual é a função de um roteador?", answers: ["Direcionar pacotes de dados entre redes", "Gerenciar a memória do computador", "Armazenar dados", "Proteger o sistema operacional", "Executar comandos em um servidor"] },
      { content: "Qual é a camada do modelo OSI responsável pela entrega confiável de dados?", answers: ["Camada de Transporte", "Camada de Aplicação", "Camada de Rede", "Camada Física", "Camada de Apresentação"] },
      { content: "O que é DHCP?", answers: ["Protocolo para atribuição automática de IPs", "Sistema de gerenciamento de redes", "Tipo de firewall", "Protocolo de transmissão de arquivos", "Tecnologia de criptografia de dados"] },
      { content: "Qual é a diferença entre TCP e UDP?", answers: ["TCP é orientado à conexão e UDP não", "UDP é orientado à conexão e TCP não", "TCP é usado para criptografia de dados", "UDP é mais lento que TCP", "TCP não garante entrega de pacotes, UDP garante"] }
    ]
  },
  {
    title: 'Banco de Dados',
    description: 'Teste seus conhecimentos sobre bancos de dados.',
    questions_and_answers: [
      { content: "O que significa SQL?", answers: ["Structured Query Language", "Sequential Query Language", "Standard Query Language", "Secure Query Language", "Server Query Language"] },
      { content: "O que é uma chave primária?", answers: ["Identificador único de uma tabela", "Uma coluna que pode ter valores duplicados", "Uma forma de encriptar dados", "Um tipo de índice de banco de dados", "Uma consulta que junta duas tabelas"] },
      { content: "O que é normalização?", answers: ["Processo de organizar dados para minimizar redundâncias", "Criação de backups", "Instalação de um banco de dados", "Processo de recuperação de dados", "Configuração de um servidor de banco de dados"] },
      { content: "Qual das seguintes é uma operação SQL?", answers: ["SELECT", "JOIN", "UNION", "ALL", "INTERSECT"] },
      { content: "Qual é a função do comando JOIN no SQL?", answers: ["Combinar dados de duas ou mais tabelas", "Selecionar todos os dados de uma tabela", "Atualizar dados em uma tabela", "Excluir dados de uma tabela", "Inserir dados em uma tabela"] }
    ]
  },
  {
    title: 'CSS',
    description: 'Teste seus conhecimentos sobre CSS (Cascading Style Sheets).',
    questions_and_answers: [
      { content: "O que significa CSS?", answers: ["Cascading Style Sheets", "Cascading Style Scripts", "Computer Style Sheets", "Colorful Style Sheets", "Creative Style Sheets"] },
      { content: "Qual é a função do CSS?", answers: ["Estilizar documentos HTML", "Adicionar funcionalidade a páginas web", "Gerenciar o banco de dados", "Configurar o servidor web", "Estruturar o conteúdo da página"] },
      { content: "O que significa a propriedade 'margin' em CSS?", answers: ["Espaço ao redor do elemento", "Espaço dentro do elemento", "Tamanho do texto", "Cor de fundo do elemento", "Largura da borda"] },
      { content: "Qual é o efeito da propriedade 'display: none' em um elemento?", answers: ["Esconde o elemento da página", "Remove o elemento do DOM", "Esconde o elemento e ainda ocupa espaço", "Exibe o elemento como bloco", "Alinha o elemento à direita"] },
      { content: "Qual é o propósito da propriedade 'flex' em CSS?", answers: ["Criar layouts flexíveis", "Adicionar animações", "Controlar a cor do texto", "Definir o tamanho da fonte", "Configurar a largura da página"] }
    ]
  },
  {
    title: 'HTML',
    description: 'Teste seus conhecimentos sobre HTML (HyperText Markup Language).',
    questions_and_answers: [
      { content: "O que significa HTML?", answers: ["HyperText Markup Language", "HyperText Markdown Language", "Hyper Transfer Markup Language", "Hyperlink Markup Language", "Hyperlink Transfer Language"] },
      { content: "Qual é a função do HTML?", answers: ["Estruturar o conteúdo da página", "Adicionar estilos à página", "Controlar a funcionalidade da página", "Gerenciar o banco de dados", "Configurar o servidor web"] },
      { content: "Qual tag é usada para criar um link em HTML?", answers: ["<a>", "<link>", "<href>", "<url>", "<script>"] },
      { content: "O que significa a tag <img> em HTML?", answers: ["Inserir uma imagem na página", "Criar um parágrafo", "Definir uma seção", "Adicionar um link", "Adicionar uma lista"] },
      { content: "Qual tag é usada para definir um parágrafo em HTML?", answers: ["<p>", "<paragraph>", "<para>", "<text>", "<section>"] }
    ]
  },
  {
    title: 'Ruby',
    description: 'Teste seus conhecimentos sobre a linguagem de programação Ruby.',
    questions_and_answers: [
      { content: "Qual é a função do operador ||= em Ruby?", answers: ["Atribui o valor apenas se a variável for nil ou false", "Atribui sempre o valor à variável", "Comparar valores", "Concatena strings", "Incrementa um valor"] },
      { content: "O que é um bloco em Ruby?", answers: ["Um pedaço de código que pode ser passado para um método", "Uma estrutura de controle de fluxo", "Um tipo de variável", "Uma gem", "Um método privado"] },
      { content: "O que é uma gem em Ruby?", answers: ["Um pacote de código que pode ser usado em aplicações Ruby", "Uma variável especial", "Um método global", "Um bloco de código reutilizável", "Uma classe de banco de dados"] },
      { content: "Qual é a função do método each em Ruby?", answers: ["Iterar sobre elementos de uma coleção", "Converter um objeto em string", "Executar um bloco de código uma vez", "Adicionar um elemento a uma lista", "Ordenar elementos de um array"] },
      { content: "Como você define uma classe em Ruby?", answers: ["class NomeDaClasse ... end", "def NomeDaClasse ... end", "module NomeDaClasse ... end", "struct NomeDaClasse ... end", "class NomeDaClasse { ... }"] }
    ]
  },
  {
    title: 'Ruby on Rails',
    description: 'Teste seus conhecimentos sobre o framework Ruby on Rails.',
    questions_and_answers: [
      { content: "Qual comando é utilizado para criar um novo projeto Rails?", answers: ["rails new", "rails create", "rails generate", "rails start", "rails init"] },
      { content: "Qual é o padrão de arquitetura utilizado pelo Rails?", answers: ["MVC (Model-View-Controller)", "MVVM (Model-View-ViewModel)", "Layered Architecture", "Monolithic", "RESTful Architecture"] },
      { content: "Qual é o arquivo principal de configuração de rotas no Rails?", answers: ["config/routes.rb", "config/application.rb", "app/controllers/application_controller.rb", "app/views/layouts/application.html.erb", "config/database.yml"] },
      { content: "Qual comando é usado para executar as migrações no Rails?", answers: ["rails db:migrate", "rails db:create", "rails db:setup", "rails migrate", "rails run:migrations"] },
      { content: "Qual é a função do Active Record no Rails?", answers: ["Gerenciar a comunicação entre modelos e o banco de dados", "Renderizar as views", "Configurar as rotas", "Gerenciar arquivos estáticos", "Configurar o ambiente de desenvolvimento"] }
    ]
  },
  {
    title: 'Java',
    description: 'Teste seus conhecimentos sobre a linguagem de programação Java.',
    questions_and_answers: [
      { content: "Qual é o compilador padrão usado para compilar programas em Java?", answers: ["javac", "java", "jvm", "javadoc", "jar"] },
      { content: "Qual é o método principal de entrada em um programa Java?", answers: ["public static void main(String[] args)", "public void main(String[] args)", "public static String main(String args)", "static public void main()", "void main(String args[])"] },
      { content: "O que significa JVM?", answers: ["Java Virtual Machine", "Java Variable Method", "Java Vendor Module", "Java Volatile Memory", "Java Version Manager"] },
      { content: "Qual é a palavra-chave usada para herança em Java?", answers: ["extends", "implements", "inherits", "super", "this"] },
      { content: "Qual das seguintes é uma Interface de Coleção no Java?", answers: ["List", "Array", "Collection", "Map", "Stream"] }
    ]
  },
  {
    title: 'Python',
    description: 'Teste seus conhecimentos sobre a linguagem de programação Python.',
    questions_and_answers: [
      { content: "Qual comando é usado para instalar pacotes em Python?", answers: ["pip install", "python install", "python -m install", "install-pkg", "pkg install"] },
      { content: "Como você define uma função em Python?", answers: ["def nome_da_funcao():", "function nome_da_funcao():", "fn nome_da_funcao:", "func nome_da_funcao():", "define nome_da_funcao:"] },
      { content: "O que é uma lista em Python?", answers: ["Uma coleção ordenada e mutável de itens", "Um tipo de variável", "Uma função embutida", "Um loop", "Um método de classe"] },
      { content: "O que faz o comando 'import' em Python?", answers: ["Inclui um módulo no código", "Define uma função", "Cria uma classe", "Executa um loop", "Declara uma variável"] },
      { content: "Qual é a principal diferença entre listas e tuplas em Python?", answers: ["Listas são mutáveis e tuplas são imutáveis", "Listas armazenam tipos diferentes, tuplas armazenam tipos iguais", "Tuplas são mutáveis e listas são imutáveis", "Tuplas são mais rápidas que listas", "Listas e tuplas são a mesma coisa"] }
    ]
  },
  {
    title: 'Git e Github',
    description: 'Teste seus conhecimentos sobre Git e GitHub.',
    questions_and_answers: [
      { content: "O que significa 'commit' em Git?", answers: ["Salvar as mudanças no repositório", "Criar um novo branch", "Mesclar dois branches", "Reverter mudanças", "Atualizar o repositório"] },
      { content: "O que é um 'branch' em Git?", answers: ["Uma versão paralela do repositório", "Uma combinação de commits", "Uma ferramenta de merge", "Um arquivo de configuração", "Um clone do repositório"] },
      { content: "Qual é o comando para enviar mudanças ao repositório remoto no Git?", answers: ["git push", "git commit", "git pull", "git merge", "git add"] },
      { content: "O que é um 'pull request' no GitHub?", answers: ["Uma solicitação para revisar e possivelmente mesclar alterações", "Uma solicitação para criar um novo branch", "Uma solicitação para clonar um repositório", "Uma solicitação para excluir um commit", "Uma solicitação para renomear um branch"] },
      { content: "Como você cria um novo repositório no Git?", answers: ["git init", "git start", "git create", "git new", "git clone"] }
    ]
  },
  {
    title: 'Tecnologia Atual',
    description: 'Teste seus conhecimentos sobre as últimas tendências tecnológicas.',
    questions_and_answers: [
      { content: "Qual é a tecnologia de comunicação sem fio que está revolucionando a indústria automobilística?", answers: ["5G", "Wi-Fi 6", "Bluetooth 5.0", "NFC", "LoRaWAN"] },
      { content: "Qual tecnologia está no centro da criação de moedas digitais, como o Bitcoin?", answers: ["Blockchain", "Inteligência Artificial", "Cloud Computing", "IoT", "5G"] },
      { content: "Qual é o impacto das redes 5G na conectividade global?", answers: ["Velocidade ultra-rápida", "Maior latência", "Menor consumo de energia", "Menos segurança", "Cobertura global"] },
      { content: "Qual empresa lançou recentemente óculos de realidade aumentada focados em produtividade?", answers: ["Apple", "Google", "Microsoft", "Amazon", "Facebook"] },
      { content: "Qual linguagem de programação se tornou a mais popular entre desenvolvedores em 2023?", answers: ["Python", "JavaScript", "C#", "Java", "Go"] }
    ]
  },
  {
    title: 'Inteligência Artificial',
    description: 'Teste seus conhecimentos sobre Inteligência Artificial e suas aplicações.',
    questions_and_answers: [
      { content: "Qual é o algoritmo de aprendizado de máquina mais comumente usado para classificação?", answers: ["SVM (Support Vector Machine)", "KNN (K-Nearest Neighbors)", "Random Forest", "Naive Bayes", "Logistic Regression"] },
      { content: "Qual é a principal vantagem das redes neurais convolucionais (CNNs)?", answers: ["Detecção automática de padrões em imagens", "Velocidade de processamento", "Capacidade de operar sem supervisão", "Maior precisão em dados estruturados", "Facilidade de implementação"] },
      { content: "Qual técnica de IA é usada para gerar texto, como em GPT?", answers: ["Redes neurais recorrentes (RNN)", "Transformers", "Redes Bayesianas", "Aprendizado profundo", "Métodos de Ensemble"] },
      { content: "Qual é o nome da técnica usada para treinar IA com feedback positivo e negativo?", answers: ["Aprendizado por Reforço", "Aprendizado Supervisionado", "Aprendizado Não Supervisionado", "Transfer Learning", "Aprendizado Semi-supervisionado"] },
      { content: "Qual é o termo para IA que pode realizar qualquer tarefa humana?", answers: ["Inteligência Artificial Geral (AGI)", "Inteligência Artificial Forte", "Inteligência Artificial Fraca", "Inteligência Artificial Específica", "Inteligência Artificial Cognitiva"] }
    ]
  }
]

# Criação de quizzes, perguntas e respostas
quizzes_data.each do |quiz_data|
  create_quiz_with_questions(quiz_data[:title], quiz_data[:description], quiz_data[:questions_and_answers])
end

puts "Banco de dados populado com os quizzes adicionais!"
