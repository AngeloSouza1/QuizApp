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
def create_quiz_with_questions(title, description, image_path, questions_and_answers)
  # Verifica se o arquivo de imagem existe
  image_file = File.open(Rails.root.join('app', 'assets', 'images', image_path)) if File.exist?(Rails.root.join('app', 'assets', 'images', image_path))
  

  quiz = Quiz.create!(
    title: title,
    description: description,
    image: image_file 
  )


  questions_and_answers.each do |question_data|
    question = quiz.questions.create!(content: question_data[:content])

    # Embaralha as respostas antes de salvá-las
    shuffled_answers = question_data[:answers].shuffle

    shuffled_answers.each do |answer_data|
      question.answers.create!(
        content: answer_data[:content],
        correct: answer_data[:correct],
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
    image: 'algoritmos.png',
    questions_and_answers: [
      { 
        content: "Qual é a complexidade de tempo do algoritmo de busca binária?", 
        answers: [
          { content: "O(log n)", correct: true },
          { content: "O(n)", correct: false },
          { content: "O(n log n)", correct: false },
          { content: "O(1)", correct: false },
          { content: "O(n^2)", correct: false }
        ]
      },
      { 
        content: "Qual é o pior caso para o algoritmo de ordenação por seleção?", 
        answers: [
          { content: "O(n^2)", correct: true },
          { content: "O(n)", correct: false },
          { content: "O(log n)", correct: false },
          { content: "O(n log n)", correct: false },
          { content: "O(1)", correct: false }
        ]
      },
      { 
        content: "O que é uma árvore binária?", 
        answers: [
          { content: "Uma estrutura de dados onde cada nó tem no máximo dois filhos", correct: true },
          { content: "Um tipo de gráfico", correct: false },
          { content: "Uma lista encadeada", correct: false },
          { content: "Um conjunto de nós desconectados", correct: false },
          { content: "Uma estrutura onde todos os nós têm exatamente três filhos", correct: false }
        ]
      },
      { 
        content: "Qual das seguintes estruturas de dados utiliza o conceito de FIFO (First In, First Out)?", 
        answers: [
          { content: "Fila", correct: true },
          { content: "Pilha", correct: false },
          { content: "Árvore", correct: false },
          { content: "Grafo", correct: false },
          { content: "Lista Duplamente Encadeada", correct: false }
        ]
      },
      { 
        content: "Qual é a principal característica de um algoritmo guloso?", 
        answers: [
          { content: "Toma a melhor decisão localmente em cada etapa", correct: true },
          { content: "Sempre encontra a solução ótima global", correct: false },
          { content: "É lento mas seguro", correct: false },
          { content: "Depende de técnicas de backtracking", correct: false },
          { content: "Funciona apenas para problemas simples", correct: false }
        ]
      },
      { 
        content: "O que é a recursão em um algoritmo?", 
        answers: [
          { content: "Um método onde a função chama a si mesma", correct: true },
          { content: "Uma técnica para dividir e conquistar", correct: false },
          { content: "Uma forma de iteração", correct: false },
          { content: "Um algoritmo de ordenação", correct: false },
          { content: "Uma técnica para armazenar dados", correct: false }
        ]
      },
      { 
        content: "Qual é a principal diferença entre uma pilha e uma fila?", 
        answers: [
          { content: "Uma pilha é LIFO (Last In, First Out) e uma fila é FIFO (First In, First Out)", correct: true },
          { content: "Uma fila é LIFO e uma pilha é FIFO", correct: false },
          { content: "Ambas seguem FIFO", correct: false },
          { content: "Ambas seguem LIFO", correct: false },
          { content: "Uma usa grafos e a outra listas", correct: false }
        ]
      },
      { 
        content: "Qual algoritmo de ordenação tem uma complexidade de tempo média de O(n log n)?", 
        answers: [
          { content: "Merge Sort", correct: true },
          { content: "Bubble Sort", correct: false },
          { content: "Selection Sort", correct: false },
          { content: "Insertion Sort", correct: false },
          { content: "Quick Sort", correct: false }
        ]
      },
      { 
        content: "Qual das seguintes estruturas de dados é usada em uma pesquisa de largura em primeiro lugar (BFS)?", 
        answers: [
          { content: "Fila", correct: true },
          { content: "Pilha", correct: false },
          { content: "Árvore Binária", correct: false },
          { content: "Tabela Hash", correct: false },
          { content: "Conjunto", correct: false }
        ]
      },
      { 
        content: "O que é um grafo acíclico?", 
        answers: [
          { content: "Um grafo que não possui ciclos", correct: true },
          { content: "Um grafo onde todos os nós estão conectados", correct: false },
          { content: "Um grafo com apenas um nó", correct: false },
          { content: "Um grafo bidimensional", correct: false },
          { content: "Um grafo onde cada nó tem um ciclo", correct: false }
        ]
      }
    ]
  },
  {
    title: 'Desenvolvimento de Aplicativos Móveis',
    description: 'Teste seus conhecimentos sobre o desenvolvimento de aplicativos móveis, incluindo plataformas, frameworks e boas práticas.',
    image: 'desenvolvimentomobile.png',
    questions_and_answers: [
      { 
        content: "Qual das seguintes linguagens de programação é comumente usada para desenvolver aplicativos Android nativos?", 
        answers: [
          { content: "Kotlin", correct: true },
          { content: "Swift", correct: false },
          { content: "JavaScript", correct: false },
          { content: "Python", correct: false },
          { content: "C++", correct: false }
        ]
      },
      { 
        content: "Qual linguagem de programação é usada para desenvolver aplicativos iOS nativos?", 
        answers: [
          { content: "Swift", correct: true },
          { content: "Kotlin", correct: false },
          { content: "C#", correct: false },
          { content: "Ruby", correct: false },
          { content: "Objective-C", correct: false }
        ]
      },
      { 
        content: "Qual é o propósito do framework React Native?", 
        answers: [
          { content: "Permitir o desenvolvimento de aplicativos móveis usando JavaScript", correct: true },
          { content: "Desenvolver aplicativos para desktop", correct: false },
          { content: "Criar servidores backend", correct: false },
          { content: "Gerenciar bancos de dados", correct: false },
          { content: "Desenvolver jogos", correct: false }
        ]
      },
      { 
        content: "Qual é o arquivo de configuração principal de um projeto Android?", 
        answers: [
          { content: "AndroidManifest.xml", correct: true },
          { content: "MainActivity.java", correct: false },
          { content: "build.gradle", correct: false },
          { content: "res/values/strings.xml", correct: false },
          { content: "settings.gradle", correct: false }
        ]
      },
      { 
        content: "O que é o SDK no contexto do desenvolvimento móvel?", 
        answers: [
          { content: "Software Development Kit", correct: true },
          { content: "System Development Kit", correct: false },
          { content: "Source Deployment Kit", correct: false },
          { content: "Service Development Kit", correct: false },
          { content: "Software Deployment Kit", correct: false }
        ]
      },
      { 
        content: "Qual ferramenta é usada para criar interfaces de usuário no iOS?", 
        answers: [
          { content: "Interface Builder", correct: true },
          { content: "Android Studio", correct: false },
          { content: "Xamarin", correct: false },
          { content: "Visual Studio Code", correct: false },
          { content: "Flutter", correct: false }
        ]
      },
      { 
        content: "O que significa a sigla APK?", 
        answers: [
          { content: "Android Package", correct: true },
          { content: "Application Package", correct: false },
          { content: "Android Product Key", correct: false },
          { content: "Application Product Key", correct: false },
          { content: "Android Programming Kit", correct: false }
        ]
      },
      { 
        content: "Qual framework permite desenvolver aplicativos móveis com uma única base de código para iOS e Android?", 
        answers: [
          { content: "Flutter", correct: true },
          { content: "Objective-C", correct: false },
          { content: "Xcode", correct: false },
          { content: "Gradle", correct: false },
          { content: "React Native", correct: false }
        ]
      },
      { 
        content: "Qual plataforma oferece uma solução baseada em cloud para testes automatizados de aplicativos móveis?", 
        answers: [
          { content: "Firebase Test Lab", correct: true },
          { content: "Xamarin Test Cloud", correct: false },
          { content: "AWS Device Farm", correct: false },
          { content: "Azure DevOps", correct: false },
          { content: "Google Cloud Functions", correct: false }
        ]
      },
      { 
        content: "Qual é o arquivo de configuração para dependências de um projeto iOS usando Swift?", 
        answers: [
          { content: "Podfile", correct: true },
          { content: "package.json", correct: false },
          { content: "Gemfile", correct: false },
          { content: "composer.json", correct: false },
          { content: "Carthage", correct: false }
        ]
      }
    ]
  },
  {
  title: 'Desenvolvimento Web',
  description: 'Avalie seus conhecimentos sobre desenvolvimento web, incluindo HTML, CSS, JavaScript e frameworks populares.',
  image: 'desenvolvimentoWEB.png',
  questions_and_answers: [
    { 
      content: "Qual é a principal função do HTML em uma página web?", 
      answers: [
        { content: "Estruturar o conteúdo da página", correct: true },
        { content: "Estilizar a página", correct: false },
        { content: "Interagir com o usuário", correct: false },
        { content: "Gerenciar o banco de dados", correct: false },
        { content: "Criar scripts de backend", correct: false }
      ]
    },
    { 
      content: "O que significa CSS?", 
      answers: [
        { content: "Cascading Style Sheets", correct: true },
        { content: "Computer Style Sheets", correct: false },
        { content: "Creative Style Sheets", correct: false },
        { content: "Colorful Style Sheets", correct: false },
        { content: "Content Styling System", correct: false }
      ]
    },
    { 
      content: "Qual atributo HTML é usado para definir estilos inline em elementos?", 
      answers: [
        { content: "style", correct: true },
        { content: "class", correct: false },
        { content: "font", correct: false },
        { content: "styles", correct: false },
        { content: "css", correct: false }
      ]
    },
    { 
      content: "Qual é a função do JavaScript em uma página web?", 
      answers: [
        { content: "Adicionar interatividade à página", correct: true },
        { content: "Estruturar o conteúdo", correct: false },
        { content: "Gerenciar o banco de dados", correct: false },
        { content: "Criar estilos personalizados", correct: false },
        { content: "Configurar o servidor web", correct: false }
      ]
    },
    { 
      content: "Qual é o propósito do framework Bootstrap?", 
      answers: [
        { content: "Facilitar a criação de layouts responsivos", correct: true },
        { content: "Gerenciar a lógica de backend", correct: false },
        { content: "Desenvolver aplicações mobile", correct: false },
        { content: "Criar gráficos dinâmicos", correct: false },
        { content: "Aprimorar a performance do servidor", correct: false }
      ]
    },
    { 
      content: "O que significa a sigla HTTP?", 
      answers: [
        { content: "Hypertext Transfer Protocol", correct: true },
        { content: "Hyperlink Text Transfer Protocol", correct: false },
        { content: "Hyper Tool Transfer Protocol", correct: false },
        { content: "Hyper Transfer Text Protocol", correct: false },
        { content: "High Transfer Text Protocol", correct: false }
      ]
    },
    { 
      content: "Qual tag HTML é usada para criar um link?", 
      answers: [
        { content: "<a>", correct: true },
        { content: "<link>", correct: false },
        { content: "<href>", correct: false },
        { content: "<url>", correct: false },
        { content: "<nav>", correct: false }
      ]
    },
    { 
      content: "O que significa DOM no contexto do desenvolvimento web?", 
      answers: [
        { content: "Document Object Model", correct: true },
        { content: "Data Object Mode", correct: false },
        { content: "Document Order Model", correct: false },
        { content: "Data Order Mode", correct: false },
        { content: "Document Orientation Method", correct: false }
      ]
    },
    { 
      content: "Qual propriedade CSS é usada para alterar a cor de fundo de um elemento?", 
      answers: [
        { content: "background-color", correct: true },
        { content: "color", correct: false },
        { content: "bgcolor", correct: false },
        { content: "background", correct: false },
        { content: "fill-color", correct: false }
      ]
    },
    { 
      content: "Qual comando Git é usado para clonar um repositório remoto?", 
      answers: [
        { content: "git clone", correct: true },
        { content: "git commit", correct: false },
        { content: "git push", correct: false },
        { content: "git pull", correct: false },
        { content: "git fetch", correct: false }
      ]
    }
  ]
},
{
  title: 'Redes de Computadores',
  description: 'Teste seus conhecimentos sobre redes de computadores, incluindo protocolos, modelos de rede e tecnologias de comunicação.',
  image: 'REDE.png',
  questions_and_answers: [
    { 
      content: "O que significa a sigla IP?", 
      answers: [
        { content: "Internet Protocol", correct: true },
        { content: "Internal Protocol", correct: false },
        { content: "Internet Procedure", correct: false },
        { content: "Internal Process", correct: false },
        { content: "Integrated Protocol", correct: false }
      ]
    },
    { 
      content: "Qual é a função principal de um roteador em uma rede?", 
      answers: [
        { content: "Encaminhar pacotes entre redes diferentes", correct: true },
        { content: "Gerenciar endereços IP", correct: false },
        { content: "Atuar como um firewall", correct: false },
        { content: "Monitorar o tráfego de rede", correct: false },
        { content: "Conectar dispositivos a uma rede local", correct: false }
      ]
    },
    { 
      content: "O que é uma máscara de sub-rede?", 
      answers: [
        { content: "Um número que divide a rede em sub-redes menores", correct: true },
        { content: "Um protocolo de segurança", correct: false },
        { content: "Um dispositivo de hardware", correct: false },
        { content: "Uma técnica de criptografia", correct: false },
        { content: "Um tipo de endereço IP", correct: false }
      ]
    },
    { 
      content: "Qual camada do modelo OSI é responsável pela entrega confiável de pacotes?", 
      answers: [
        { content: "Camada de Transporte", correct: true },
        { content: "Camada de Rede", correct: false },
        { content: "Camada de Enlace", correct: false },
        { content: "Camada de Sessão", correct: false },
        { content: "Camada de Apresentação", correct: false }
      ]
    },
    { 
      content: "Qual protocolo é usado para resolver endereços IP a partir de endereços MAC?", 
      answers: [
        { content: "ARP (Address Resolution Protocol)", correct: true },
        { content: "DNS (Domain Name System)", correct: false },
        { content: "DHCP (Dynamic Host Configuration Protocol)", correct: false },
        { content: "HTTP (Hypertext Transfer Protocol)", correct: false },
        { content: "FTP (File Transfer Protocol)", correct: false }
      ]
    },
    { 
      content: "O que caracteriza uma rede LAN?", 
      answers: [
        { content: "Uma rede que cobre uma área geograficamente limitada, como uma casa ou escritório", correct: true },
        { content: "Uma rede que conecta cidades ou países", correct: false },
        { content: "Uma rede para transmissão de dados via satélite", correct: false },
        { content: "Uma rede pública de acesso gratuito", correct: false },
        { content: "Uma rede que opera em frequências de rádio", correct: false }
      ]
    },
    { 
      content: "Qual das seguintes tecnologias é usada para redes sem fio?", 
      answers: [
        { content: "Wi-Fi", correct: true },
        { content: "Ethernet", correct: false },
        { content: "DSL", correct: false },
        { content: "ISDN", correct: false },
        { content: "Token Ring", correct: false }
      ]
    },
    { 
      content: "Qual é a função do protocolo DNS?", 
      answers: [
        { content: "Traduzir nomes de domínio em endereços IP", correct: true },
        { content: "Gerenciar endereços IP dinâmicos", correct: false },
        { content: "Proteger a rede contra ataques", correct: false },
        { content: "Monitorar o tráfego de rede", correct: false },
        { content: "Protocolo de envio de emails", correct: false }
      ]
    },
    { 
      content: "Qual é o protocolo padrão para enviar emails pela Internet?", 
      answers: [
        { content: "SMTP (Simple Mail Transfer Protocol)", correct: true },
        { content: "POP3 (Post Office Protocol)", correct: false },
        { content: "IMAP (Internet Message Access Protocol)", correct: false },
        { content: "HTTP (Hypertext Transfer Protocol)", correct: false },
        { content: "FTP (File Transfer Protocol)", correct: false }
      ]
    },
    { 
      content: "O que significa a sigla VPN?", 
      answers: [
        { content: "Virtual Private Network", correct: true },
        { content: "Virtual Protocol Network", correct: false },
        { content: "Visual Private Network", correct: false },
        { content: "Virtual Public Network", correct: false },
        { content: "Virtual Protected Network", correct: false }
      ]
    }
  ]
},
{
  title: 'HTML',
  description: 'Teste seus conhecimentos sobre HTML, a linguagem de marcação utilizada para criar páginas web.',
  image: 'html.png',
  questions_and_answers: [
    { 
      content: "O que significa a sigla HTML?", 
      answers: [
        { content: "HyperText Markup Language", correct: true },
        { content: "HyperTool Markup Language", correct: false },
        { content: "Hyperlink Markup Language", correct: false },
        { content: "Hyper Transfer Markup Language", correct: false },
        { content: "HyperText Management Language", correct: false }
      ]
    },
    { 
      content: "Qual tag é usada para criar um parágrafo em HTML?", 
      answers: [
        { content: "<p>", correct: true },
        { content: "<paragraph>", correct: false },
        { content: "<pg>", correct: false },
        { content: "<text>", correct: false },
        { content: "<pr>", correct: false }
      ]
    },
    { 
      content: "Qual atributo HTML é usado para definir um identificador único para um elemento?", 
      answers: [
        { content: "id", correct: true },
        { content: "class", correct: false },
        { content: "name", correct: false },
        { content: "style", correct: false },
        { content: "key", correct: false }
      ]
    },
    { 
      content: "Qual é a função da tag <a> em HTML?", 
      answers: [
        { content: "Criar um hyperlink", correct: true },
        { content: "Incorporar um arquivo de áudio", correct: false },
        { content: "Adicionar uma imagem", correct: false },
        { content: "Definir um cabeçalho", correct: false },
        { content: "Criar uma lista", correct: false }
      ]
    },
    { 
      content: "Qual tag HTML é usada para exibir uma imagem?", 
      answers: [
        { content: "<img>", correct: true },
        { content: "<image>", correct: false },
        { content: "<picture>", correct: false },
        { content: "<media>", correct: false },
        { content: "<src>", correct: false }
      ]
    },
    { 
      content: "Qual atributo da tag <img> especifica o caminho para o arquivo de imagem?", 
      answers: [
        { content: "src", correct: true },
        { content: "href", correct: false },
        { content: "link", correct: false },
        { content: "path", correct: false },
        { content: "url", correct: false }
      ]
    },
    { 
      content: "Qual tag HTML é usada para criar um item de lista em uma lista não ordenada?", 
      answers: [
        { content: "<li>", correct: true },
        { content: "<ul>", correct: false },
        { content: "<ol>", correct: false },
        { content: "<list>", correct: false },
        { content: "<item>", correct: false }
      ]
    },
    { 
      content: "Qual é a tag correta para um título de nível 1 em HTML?", 
      answers: [
        { content: "<h1>", correct: true },
        { content: "<header>", correct: false },
        { content: "<h>", correct: false },
        { content: "<head>", correct: false },
        { content: "<h2>", correct: false }
      ]
    },
    { 
      content: "Qual tag HTML é usada para definir uma tabela?", 
      answers: [
        { content: "<table>", correct: true },
        { content: "<tab>", correct: false },
        { content: "<tbl>", correct: false },
        { content: "<td>", correct: false },
        { content: "<tr>", correct: false }
      ]
    },
    { 
      content: "Qual atributo HTML é usado para mesclar células de uma tabela horizontalmente?", 
      answers: [
        { content: "colspan", correct: true },
        { content: "rowspan", correct: false },
        { content: "merge", correct: false },
        { content: "colmerge", correct: false },
        { content: "span", correct: false }
      ]
    }
  ]
},
{
  title: 'Banco de Dados',
  image: 'bancodados.png',
  description: 'Teste seus conhecimentos sobre bancos de dados, incluindo SQL, modelos de dados e conceitos fundamentais de armazenamento.',
  questions_and_answers: [
    { 
      content: "O que significa a sigla SQL?", 
      answers: [
        { content: "Structured Query Language", correct: true },
        { content: "Structured Question Language", correct: false },
        { content: "Simple Query Language", correct: false },
        { content: "Structured Quick Language", correct: false },
        { content: "Simple Question Language", correct: false }
      ]
    },
    { 
      content: "Qual comando SQL é usado para selecionar dados de um banco de dados?", 
      answers: [
        { content: "SELECT", correct: true },
        { content: "EXTRACT", correct: false },
        { content: "FIND", correct: false },
        { content: "GET", correct: false },
        { content: "QUERY", correct: false }
      ]
    },
    { 
      content: "Qual é a função de uma chave primária (primary key) em um banco de dados relacional?", 
      answers: [
        { content: "Identificar unicamente cada registro em uma tabela", correct: true },
        { content: "Vincular duas tabelas diferentes", correct: false },
        { content: "Armazenar dados duplicados", correct: false },
        { content: "Realizar cálculos matemáticos", correct: false },
        { content: "Proteger dados confidenciais", correct: false }
      ]
    },
    { 
      content: "Qual comando SQL é usado para inserir novos dados em uma tabela?", 
      answers: [
        { content: "INSERT INTO", correct: true },
        { content: "ADD DATA", correct: false },
        { content: "UPDATE TABLE", correct: false },
        { content: "INSERT NEW", correct: false },
        { content: "NEW RECORD", correct: false }
      ]
    },
    { 
      content: "O que é um índice (index) em um banco de dados?", 
      answers: [
        { content: "Uma estrutura que melhora a velocidade de busca de dados", correct: true },
        { content: "Uma chave estrangeira que vincula tabelas", correct: false },
        { content: "Uma função para calcular valores", correct: false },
        { content: "Um tipo de dado usado para armazenar textos longos", correct: false },
        { content: "Uma estrutura que define a integridade dos dados", correct: false }
      ]
    },
    { 
      content: "Qual dos seguintes é um banco de dados NoSQL?", 
      answers: [
        { content: "MongoDB", correct: true },
        { content: "MySQL", correct: false },
        { content: "PostgreSQL", correct: false },
        { content: "Oracle", correct: false },
        { content: "SQLite", correct: false }
      ]
    },
    { 
      content: "Qual comando SQL é usado para atualizar dados existentes em uma tabela?", 
      answers: [
        { content: "UPDATE", correct: true },
        { content: "CHANGE", correct: false },
        { content: "MODIFY", correct: false },
        { content: "ALTER", correct: false },
        { content: "REVISE", correct: false }
      ]
    },
    { 
      content: "O que é normalização (normalization) em banco de dados?", 
      answers: [
        { content: "O processo de organizar dados para reduzir redundância", correct: true },
        { content: "A técnica de criptografar dados", correct: false },
        { content: "A estruturação de dados em forma de árvore", correct: false },
        { content: "A criação de índices para otimizar buscas", correct: false },
        { content: "A técnica de backup de dados", correct: false }
      ]
    },
    { 
      content: "O que é uma chave estrangeira (foreign key) em um banco de dados relacional?", 
      answers: [
        { content: "Um campo que cria uma ligação entre duas tabelas", correct: true },
        { content: "A chave principal de uma tabela", correct: false },
        { content: "Uma chave que não pode ter valores duplicados", correct: false },
        { content: "Um campo que armazena valores únicos", correct: false },
        { content: "Uma chave usada para encriptar dados", correct: false }
      ]
    },
    { 
      content: "Qual dos seguintes comandos SQL é usado para remover dados de uma tabela?", 
      answers: [
        { content: "DELETE", correct: true },
        { content: "REMOVE", correct: false },
        { content: "DROP", correct: false },
        { content: "ERASE", correct: false },
        { content: "TRUNCATE", correct: false }
      ]
    }
  ]
},
{
  title: 'CSS',
  image: 'CSS.png',
  description: 'Teste seus conhecimentos sobre CSS, a linguagem usada para estilizar páginas web.',
  questions_and_answers: [
    { 
      content: "O que significa a sigla CSS?", 
      answers: [
        { content: "Cascading Style Sheets", correct: true },
        { content: "Computer Style Sheets", correct: false },
        { content: "Creative Style Sheets", correct: false },
        { content: "Cascading Simple Sheets", correct: false },
        { content: "Colorful Style Sheets", correct: false }
      ]
    },
    { 
      content: "Qual propriedade CSS é usada para mudar a cor de fundo de um elemento?", 
      answers: [
        { content: "background-color", correct: true },
        { content: "color", correct: false },
        { content: "bgcolor", correct: false },
        { content: "background-image", correct: false },
        { content: "fill-color", correct: false }
      ]
    },
    { 
      content: "Como você define o tamanho da fonte de um elemento em CSS?", 
      answers: [
        { content: "font-size", correct: true },
        { content: "text-size", correct: false },
        { content: "font-style", correct: false },
        { content: "text-style", correct: false },
        { content: "size", correct: false }
      ]
    },
    { 
      content: "Qual é a propriedade CSS usada para definir o espaço interno de um elemento?", 
      answers: [
        { content: "padding", correct: true },
        { content: "margin", correct: false },
        { content: "border", correct: false },
        { content: "spacing", correct: false },
        { content: "gap", correct: false }
      ]
    },
    { 
      content: "Qual valor de `position` faz com que um elemento seja removido do fluxo normal do documento e posicionado em relação ao seu parente mais próximo?", 
      answers: [
        { content: "absolute", correct: true },
        { content: "relative", correct: false },
        { content: "fixed", correct: false },
        { content: "static", correct: false },
        { content: "sticky", correct: false }
      ]
    },
    { 
      content: "Como você pode centralizar horizontalmente um elemento `div` com uma largura fixa?", 
      answers: [
        { content: "margin: 0 auto;", correct: true },
        { content: "align: center;", correct: false },
        { content: "text-align: center;", correct: false },
        { content: "padding: 0 auto;", correct: false },
        { content: "margin: auto 0;", correct: false }
      ]
    },
    { 
      content: "Qual propriedade CSS é usada para criar uma borda ao redor de um elemento?", 
      answers: [
        { content: "border", correct: true },
        { content: "outline", correct: false },
        { content: "margin", correct: false },
        { content: "padding", correct: false },
        { content: "box-shadow", correct: false }
      ]
    },
    { 
      content: "Qual propriedade CSS é usada para controlar a transparência de um elemento?", 
      answers: [
        { content: "opacity", correct: true },
        { content: "visibility", correct: false },
        { content: "display", correct: false },
        { content: "filter", correct: false },
        { content: "alpha", correct: false }
      ]
    },
    { 
      content: "Qual propriedade CSS é usada para alterar a cor do texto de um elemento?", 
      answers: [
        { content: "color", correct: true },
        { content: "font-color", correct: false },
        { content: "text-color", correct: false },
        { content: "background-color", correct: false },
        { content: "fill-color", correct: false }
      ]
    },
    { 
      content: "Qual propriedade CSS define a altura de uma linha de texto?", 
      answers: [
        { content: "line-height", correct: true },
        { content: "text-height", correct: false },
        { content: "font-size", correct: false },
        { content: "height", correct: false },
        { content: "spacing", correct: false }
      ]
    }
  ]
},
{
  title: 'Ruby',
  image: 'ruby.png',
  description: 'Teste seus conhecimentos sobre a linguagem de programação Ruby, seus conceitos e funcionalidades.',
  questions_and_answers: [
    { 
      content: "O que significa a sigla `IRB` no contexto da linguagem Ruby?", 
      answers: [
        { content: "Interactive Ruby", correct: true },
        { content: "Internet Ruby", correct: false },
        { content: "Integrated Ruby", correct: false },
        { content: "Instance Ruby", correct: false },
        { content: "Internal Ruby", correct: false }
      ]
    },
    { 
      content: "Qual das seguintes estruturas é usada para armazenar uma coleção de dados ordenada em Ruby?", 
      answers: [
        { content: "Array", correct: true },
        { content: "Hash", correct: false },
        { content: "Set", correct: false },
        { content: "Queue", correct: false },
        { content: "Tree", correct: false }
      ]
    },
    { 
      content: "Como você define um método em Ruby?", 
      answers: [
        { content: "def method_name", correct: true },
        { content: "function methodName()", correct: false },
        { content: "method methodName", correct: false },
        { content: "define method_name", correct: false },
        { content: "proc methodName", correct: false }
      ]
    },
    { 
    content: "O que a expressão {variavel} faz em uma string em Ruby?", 
      answers: [
        { content: "Interpela o valor da variável dentro da string", correct: true },
        { content: "Converte a variável em uma string", correct: false },
        { content: "Imprime o valor da variável", correct: false },
        { content: "Substitui a variável pela string", correct: false },
        { content: "Formata a string com a variável", correct: false }
      ]
    },
    { 
      content: "Qual operador é usado para verificar igualdade em Ruby?", 
      answers: [
        { content: "==", correct: true },
        { content: "=", correct: false },
        { content: "===", correct: false },
        { content: "!=", correct: false },
        { content: "!==", correct: false }
      ]
    },
    { 
      content: "Como você define uma classe em Ruby?", 
      answers: [
        { content: "class ClassName", correct: true },
        { content: "define ClassName", correct: false },
        { content: "class_name ClassName", correct: false },
        { content: "def ClassName", correct: false },
        { content: "module ClassName", correct: false }
      ]
    },
    { 
      content: "Qual das seguintes opções é um método de iteração em Ruby?", 
      answers: [
        { content: "each", correct: true },
        { content: "iterate", correct: false },
        { content: "loop", correct: false },
        { content: "forEach", correct: false },
        { content: "cycle", correct: false }
      ]
    },
    { 
      content: "Qual é o resultado de `5.times { |i| print i }` em Ruby?", 
      answers: [
        { content: "01234", correct: true },
        { content: "12345", correct: false },
        { content: "54321", correct: false },
        { content: "11111", correct: false },
        { content: "55555", correct: false }
      ]
    },
    { 
      content: "Qual é o valor retornado por um método em Ruby se `return` não é explicitamente utilizado?", 
      answers: [
        { content: "O valor da última expressão avaliada", correct: true },
        { content: "nil", correct: false },
        { content: "true", correct: false },
        { content: "false", correct: false },
        { content: "Um erro é lançado", correct: false }
      ]
    },
    { 
      content: "Qual símbolo é usado para definir um bloco em Ruby?", 
      answers: [
        { content: "do...end", correct: true },
        { content: "{...}", correct: false },
        { content: "(...)", correct: false },
        { content: "[...]", correct: false },
        { content: "<...>", correct: false }
      ]
    }
  ]
},
{
  title: 'Ruby on Rails',
  image: 'rails.png',
  description: 'Teste seus conhecimentos sobre Ruby on Rails, o framework web baseado na linguagem Ruby.',
  questions_and_answers: [
    { 
      content: "O que significa a sigla MVC no contexto do Ruby on Rails?", 
      answers: [
        { content: "Model View Controller", correct: true },
        { content: "Main View Controller", correct: false },
        { content: "Module View Component", correct: false },
        { content: "Model View Component", correct: false },
        { content: "Main Visual Controller", correct: false }
      ]
    },
    { 
      content: "Qual comando é usado para criar um novo projeto Rails?", 
      answers: [
        { content: "rails new", correct: true },
        { content: "rails generate", correct: false },
        { content: "rails start", correct: false },
        { content: "rails create", correct: false },
        { content: "rails init", correct: false }
      ]
    },
    { 
      content: "Qual arquivo contém a configuração de rotas em um aplicativo Rails?", 
      answers: [
        { content: "config/routes.rb", correct: true },
        { content: "app/controllers/routes.rb", correct: false },
        { content: "config/initializers/routes.rb", correct: false },
        { content: "app/config/routes.rb", correct: false },
        { content: "config/routes/config.rb", correct: false }
      ]
    },
    { 
      content: "Qual é o comando usado para gerar um scaffold em Rails?", 
      answers: [
        { content: "rails generate scaffold", correct: true },
        { content: "rails generate model", correct: false },
        { content: "rails scaffold", correct: false },
        { content: "rails create scaffold", correct: false },
        { content: "rails g scaffold", correct: false }
      ]
    },
    { 
      content: "Qual das seguintes opções é um ORM utilizado por padrão em Rails?", 
      answers: [
        { content: "ActiveRecord", correct: true },
        { content: "Sequel", correct: false },
        { content: "DataMapper", correct: false },
        { content: "Mongoid", correct: false },
        { content: "ActiveModel", correct: false }
      ]
    },
    { 
      content: "O que é um `migration` em Rails?", 
      answers: [
        { content: "Uma forma de versionar mudanças no banco de dados", correct: true },
        { content: "Um arquivo de configuração de rotas", correct: false },
        { content: "Um controlador para gerenciar modelos", correct: false },
        { content: "Uma técnica de carregamento de páginas", correct: false },
        { content: "Uma ferramenta para gerar scaffolds", correct: false }
      ]
    },
    { 
      content: "Qual comando Rails é usado para aplicar migrações pendentes ao banco de dados?", 
      answers: [
        { content: "rails db:migrate", correct: true },
        { content: "rails db:update", correct: false },
        { content: "rails migrate", correct: false },
        { content: "rails schema:update", correct: false },
        { content: "rails db:seed", correct: false }
      ]
    },
    { 
      content: "O que faz o método `render` em um controlador Rails?", 
      answers: [
        { content: "Renderiza uma view para o cliente", correct: true },
        { content: "Redireciona para outra ação", correct: false },
        { content: "Renderiza um partial de outro controlador", correct: false },
        { content: "Inicia o servidor Rails", correct: false },
        { content: "Cria um novo registro no banco de dados", correct: false }
      ]
    },
    { 
      content: "Como você define um relacionamento `has_many` em um modelo Rails?", 
      answers: [
        { content: "has_many :outros_modelos", correct: true },
        { content: "has_many outros_modelos", correct: false },
        { content: "belongs_to :outros_modelos", correct: false },
        { content: "many :outros_modelos", correct: false },
        { content: "has_multiple :outros_modelos", correct: false }
      ]
    },
    { 
      content: "Qual comando Rails é usado para iniciar o servidor local durante o desenvolvimento?", 
      answers: [
        { content: "rails server", correct: true },
        { content: "rails start", correct: false },
        { content: "rails begin", correct: false },
        { content: "rails s", correct: false },
        { content: "rails run", correct: false }
      ]
    }
  ]
},
{
  title: 'Java',
  image: 'java.png',
  description: 'Teste seus conhecimentos sobre a linguagem de programação Java, incluindo sintaxe, conceitos e práticas comuns.',
  questions_and_answers: [
    { 
      content: "Qual palavra-chave em Java é usada para herdar uma classe?", 
      answers: [
        { content: "extends", correct: true },
        { content: "implements", correct: false },
        { content: "inherits", correct: false },
        { content: "extends_from", correct: false },
        { content: "inherits_from", correct: false }
      ]
    },
    { 
      content: "Qual método é a porta de entrada para a execução de um programa Java?", 
      answers: [
        { content: "public static void main(String[] args)", correct: true },
        { content: "public static void main()", correct: false },
        { content: "public void main(String[] args)", correct: false },
        { content: "public void main()", correct: false },
        { content: "public static void main(String args)", correct: false }
      ]
    },
    { 
      content: "Qual dos seguintes modificadores de acesso permite que um membro seja acessado apenas dentro do mesmo pacote?", 
      answers: [
        { content: "default", correct: true },
        { content: "public", correct: false },
        { content: "protected", correct: false },
        { content: "private", correct: false },
        { content: "package-private", correct: false }
      ]
    },
    { 
      content: "Qual das seguintes opções define corretamente uma classe em Java?", 
      answers: [
        { content: "public class MinhaClasse {}", correct: true },
        { content: "class MinhaClasse extends {}", correct: false },
        { content: "class MinhaClasse implements {}", correct: false },
        { content: "public MinhaClasse {}", correct: false },
        { content: "new class MinhaClasse {}", correct: false }
      ]
    },
    { 
      content: "Como você cria uma instância de uma classe em Java?", 
      answers: [
        { content: "MinhaClasse obj = new MinhaClasse();", correct: true },
        { content: "MinhaClasse obj = MinhaClasse();", correct: false },
        { content: "MinhaClasse obj();", correct: false },
        { content: "new MinhaClasse obj();", correct: false },
        { content: "MinhaClasse obj = new();", correct: false }
      ]
    },
    { 
      content: "Qual das seguintes opções é um loop `for` correto em Java?", 
      answers: [
        { content: "for(int i = 0; i < 10; i++) {}", correct: true },
        { content: "for i = 0 to 10 {}", correct: false },
        { content: "for(int i; i < 10; i++) {}", correct: false },
        { content: "for(i = 0; i < 10; i++) {}", correct: false },
        { content: "for i = 0; i < 10; i++ {}", correct: false }
      ]
    },
    { 
      content: "O que é a JVM em Java?", 
      answers: [
        { content: "Java Virtual Machine", correct: true },
        { content: "Java Version Manager", correct: false },
        { content: "Java Variable Method", correct: false },
        { content: "Java Virtual Method", correct: false },
        { content: "Java Verified Machine", correct: false }
      ]
    },
    { 
      content: "Qual das seguintes exceções é lançada quando ocorre uma divisão por zero em Java?", 
      answers: [
        { content: "ArithmeticException", correct: true },
        { content: "NullPointerException", correct: false },
        { content: "ArrayIndexOutOfBoundsException", correct: false },
        { content: "NumberFormatException", correct: false },
        { content: "IllegalArgumentException", correct: false }
      ]
    },
    { 
      content: "Qual palavra-chave é usada para criar uma interface em Java?", 
      answers: [
        { content: "interface", correct: true },
        { content: "implements", correct: false },
        { content: "abstract", correct: false },
        { content: "interface_class", correct: false },
        { content: "protocol", correct: false }
      ]
    },
    { 
      content: "Qual método da classe Object em Java é usado para comparar se dois objetos são iguais?", 
      answers: [
        { content: "equals()", correct: true },
        { content: "compare()", correct: false },
        { content: "==", correct: false },
        { content: "equalsIgnoreCase()", correct: false },
        { content: "isEqual()", correct: false }
      ]
    }
  ]
},
{
  title: 'Python',
  image: 'pyhon.png',
  description: 'Teste seus conhecimentos sobre a linguagem de programação Python, incluindo sintaxe, conceitos e funcionalidades.',
  questions_and_answers: [
    { 
      content: "Qual das seguintes palavras-chave é usada para definir uma função em Python?", 
      answers: [
        { content: "def", correct: true },
        { content: "func", correct: false },
        { content: "function", correct: false },
        { content: "lambda", correct: false },
        { content: "define", correct: false }
      ]
    },
    { 
      content: "Como você pode adicionar um comentário em um código Python?", 
      answers: [
        { content: "# Este é um comentário", correct: true },
        { content: "// Este é um comentário", correct: false },
        { content: "/* Este é um comentário */", correct: false },
        { content: "<!-- Este é um comentário -->", correct: false },
        { content: "** Este é um comentário", correct: false }
      ]
    },
    { 
      content: "Qual das seguintes opções é usada para criar uma lista em Python?", 
      answers: [
        { content: "[1, 2, 3]", correct: true },
        { content: "{1, 2, 3}", correct: false },
        { content: "(1, 2, 3)", correct: false },
        { content: "<1, 2, 3>", correct: false },
        { content: "list(1, 2, 3)", correct: false }
      ]
    },
    { 
      content: "Qual função é usada para obter o comprimento de uma lista em Python?", 
      answers: [
        { content: "len()", correct: true },
        { content: "length()", correct: false },
        { content: "size()", correct: false },
        { content: "count()", correct: false },
        { content: "get_length()", correct: false }
      ]
    },
    { 
      content: "Como você pode criar um dicionário em Python?", 
      answers: [
        { content: '{"chave": "valor"}', correct: true },
        { content: '["chave": "valor"]', correct: false },
        { content: '{"chave", "valor"}', correct: false },
        { content: '("chave": "valor")', correct: false },
        { content: 'dict["chave"] = "valor"', correct: false }
      ]
    },
    { 
      content: "Qual palavra-chave é usada para verificar se uma condição é verdadeira em Python?", 
      answers: [
        { content: "if", correct: true },
        { content: "while", correct: false },
        { content: "for", correct: false },
        { content: "else", correct: false },
        { content: "do", correct: false }
      ]
    },
    { 
      content: "O que o método `append()` faz em uma lista em Python?", 
      answers: [
        { content: "Adiciona um elemento ao final da lista", correct: true },
        { content: "Remove um elemento da lista", correct: false },
        { content: "Adiciona um elemento ao início da lista", correct: false },
        { content: "Substitui um elemento na lista", correct: false },
        { content: "Ordena a lista", correct: false }
      ]
    },
    { 
      content: "Como você declara uma variável chamada `x` com o valor 10 em Python?", 
      answers: [
        { content: "x = 10", correct: true },
        { content: "int x = 10", correct: false },
        { content: "x := 10", correct: false },
        { content: "let x = 10", correct: false },
        { content: "x == 10", correct: false }
      ]
    },
    { 
      content: "Qual função é usada para converter uma string em um inteiro em Python?", 
      answers: [
        { content: "int()", correct: true },
        { content: "str()", correct: false },
        { content: "float()", correct: false },
        { content: "convert()", correct: false },
        { content: "eval()", correct: false }
      ]
    },
    { 
      content: "Qual é o resultado de `2 ** 3` em Python?", 
      answers: [
        { content: "8", correct: true },
        { content: "6", correct: false },
        { content: "9", correct: false },
        { content: "5", correct: false },
        { content: "10", correct: false }
      ]
    }
  ]
},
{
  title: 'Git e GitHub',
  image: 'git.png',
  description: 'Teste seus conhecimentos sobre Git e GitHub, ferramentas essenciais para controle de versão e colaboração em projetos de software.',
  questions_and_answers: [
    { 
      content: "Qual comando Git é usado para criar um novo repositório?", 
      answers: [
        { content: "git init", correct: true },
        { content: "git start", correct: false },
        { content: "git new", correct: false },
        { content: "git create", correct: false },
        { content: "git repo", correct: false }
      ]
    },
    { 
      content: "Qual comando Git é usado para fazer o commit de mudanças?", 
      answers: [
        { content: "git commit -m 'mensagem'", correct: true },
        { content: "git add commit 'mensagem'", correct: false },
        { content: "git save 'mensagem'", correct: false },
        { content: "git push commit 'mensagem'", correct: false },
        { content: "git update 'mensagem'", correct: false }
      ]
    },
    { 
      content: "Qual comando Git é usado para ver o histórico de commits?", 
      answers: [
        { content: "git log", correct: true },
        { content: "git history", correct: false },
        { content: "git status", correct: false },
        { content: "git show", correct: false },
        { content: "git commit history", correct: false }
      ]
    },
    { 
      content: "O que o comando `git clone` faz?", 
      answers: [
        { content: "Copia um repositório remoto para a máquina local", correct: true },
        { content: "Cria um novo repositório", correct: false },
        { content: "Adiciona mudanças ao repositório", correct: false },
        { content: "Atualiza o repositório local", correct: false },
        { content: "Remove um repositório", correct: false }
      ]
    },
    { 
      content: "Qual comando Git é usado para enviar mudanças locais para um repositório remoto?", 
      answers: [
        { content: "git push", correct: true },
        { content: "git pull", correct: false },
        { content: "git upload", correct: false },
        { content: "git sync", correct: false },
        { content: "git commit", correct: false }
      ]
    },
    { 
      content: "O que significa o termo 'branch' em Git?", 
      answers: [
        { content: "Uma ramificação separada da linha principal de desenvolvimento", correct: true },
        { content: "Uma cópia de um commit específico", correct: false },
        { content: "O histórico completo de um repositório", correct: false },
        { content: "O nome de um commit", correct: false },
        { content: "O diretório principal do projeto", correct: false }
      ]
    },
    { 
      content: "Qual comando Git é usado para criar uma nova branch?", 
      answers: [
        { content: "git branch nome_da_branch", correct: true },
        { content: "git checkout nome_da_branch", correct: false },
        { content: "git new branch nome_da_branch", correct: false },
        { content: "git create branch nome_da_branch", correct: false },
        { content: "git branch create nome_da_branch", correct: false }
      ]
    },
    { 
      content: "O que acontece quando você faz um `git merge`?", 
      answers: [
        { content: "Combina mudanças de diferentes branches", correct: true },
        { content: "Apaga uma branch", correct: false },
        { content: "Renomeia uma branch", correct: false },
        { content: "Cria uma nova branch", correct: false },
        { content: "Desfaz um commit", correct: false }
      ]
    },
    { 
      content: "Qual comando Git é usado para atualizar o repositório local com as mudanças de um repositório remoto?", 
      answers: [
        { content: "git pull", correct: true },
        { content: "git push", correct: false },
        { content: "git fetch", correct: false },
        { content: "git merge", correct: false },
        { content: "git update", correct: false }
      ]
    },
    { 
      content: "O que é um 'fork' no GitHub?", 
      answers: [
        { content: "Uma cópia de um repositório para sua conta GitHub", correct: true },
        { content: "Uma nova branch em um repositório", correct: false },
        { content: "Uma forma de renomear um repositório", correct: false },
        { content: "Um backup de um repositório", correct: false },
        { content: "Uma fusão de dois repositórios", correct: false }
      ]
    }
  ]
},
{
  title: 'Tecnologia Atual',
  image:'tecnologiaatual.png',
  description: 'Teste seus conhecimentos sobre as tecnologias mais recentes e tendências em diversas áreas, como inteligência artificial, computação em nuvem, e criptomoedas.',
  questions_and_answers: [
    { 
      content: "Qual das seguintes tecnologias é frequentemente associada ao conceito de blockchain?", 
      answers: [
        { content: "Criptomoedas", correct: true },
        { content: "Realidade Aumentada", correct: false },
        { content: "Internet das Coisas", correct: false },
        { content: "Computação Quântica", correct: false },
        { content: "Computação em Nuvem", correct: false }
      ]
    },
    { 
      content: "O que significa a sigla 'AI' no contexto de tecnologia?", 
      answers: [
        { content: "Inteligência Artificial", correct: true },
        { content: "Interface Adaptativa", correct: false },
        { content: "Análise de Imagem", correct: false },
        { content: "Internet Autônoma", correct: false },
        { content: "Algoritmo Inteligente", correct: false }
      ]
    },
    { 
      content: "Qual empresa desenvolveu o processador M1, amplamente utilizado em seus dispositivos?", 
      answers: [
        { content: "Apple", correct: true },
        { content: "Intel", correct: false },
        { content: "AMD", correct: false },
        { content: "Qualcomm", correct: false },
        { content: "NVIDIA", correct: false }
      ]
    },
    { 
      content: "O que é 5G?", 
      answers: [
        { content: "A quinta geração de redes móveis", correct: true },
        { content: "Um novo padrão de Wi-Fi", correct: false },
        { content: "Uma tecnologia de computação quântica", correct: false },
        { content: "Uma plataforma de streaming", correct: false },
        { content: "Um protocolo de criptografia", correct: false }
      ]
    },
    { 
      content: "Qual das seguintes empresas é mais conhecida por seu serviço de computação em nuvem chamado AWS?", 
      answers: [
        { content: "Amazon", correct: true },
        { content: "Google", correct: false },
        { content: "Microsoft", correct: false },
        { content: "IBM", correct: false },
        { content: "Oracle", correct: false }
      ]
    },
    { 
      content: "O que significa o termo 'IoT'?", 
      answers: [
        { content: "Internet das Coisas", correct: true },
        { content: "Interface de Operação Técnica", correct: false },
        { content: "Instrumentos de Otimização Térmica", correct: false },
        { content: "Interação de Objetos Tecnológicos", correct: false },
        { content: "Inteligência Operacional Tática", correct: false }
      ]
    },
    { 
      content: "Qual linguagem de programação é frequentemente associada ao desenvolvimento de IA e aprendizado de máquina?", 
      answers: [
        { content: "Python", correct: true },
        { content: "Java", correct: false },
        { content: "JavaScript", correct: false },
        { content: "C#", correct: false },
        { content: "Ruby", correct: false }
      ]
    },
    { 
      content: "Qual dessas é uma criptomoeda amplamente utilizada?", 
      answers: [
        { content: "Bitcoin", correct: true },
        { content: "PayPal", correct: false },
        { content: "Ethereum", correct: false },
        { content: "Litecoin", correct: false },
        { content: "Monero", correct: false }
      ]
    },
    { 
      content: "Qual das seguintes tecnologias é essencial para a construção de aplicativos descentralizados (DApps)?", 
      answers: [
        { content: "Blockchain", correct: true },
        { content: "Computação em Nuvem", correct: false },
        { content: "Realidade Virtual", correct: false },
        { content: "5G", correct: false },
        { content: "Big Data", correct: false }
      ]
    },
    { 
      content: "Qual é a principal função dos data centers de uma empresa de computação em nuvem?", 
      answers: [
        { content: "Armazenar e processar grandes volumes de dados", correct: true },
        { content: "Gerenciar transações financeiras", correct: false },
        { content: "Desenvolver software de inteligência artificial", correct: false },
        { content: "Criar conteúdo de mídia digital", correct: false },
        { content: "Operar sistemas de energia renovável", correct: false }
      ]
    }
  ]
},
{
  title: 'Inteligência Artificial',
  image: 'IA.png',
  description: 'Teste seus conhecimentos sobre Inteligência Artificial, incluindo conceitos, técnicas e aplicações.',
  questions_and_answers: [
    { 
      content: "O que é Inteligência Artificial (IA)?", 
      answers: [
        { content: "A simulação de processos de inteligência humana por máquinas", correct: true },
        { content: "A capacidade das máquinas de se replicarem", correct: false },
        { content: "Um sistema que gerencia redes de computadores", correct: false },
        { content: "A criação de hardware para computadores", correct: false },
        { content: "Um algoritmo que processa dados de forma linear", correct: false }
      ]
    },
    { 
      content: "Qual é a técnica mais comum usada para treinar modelos de aprendizado de máquina?", 
      answers: [
        { content: "Aprendizado supervisionado", correct: true },
        { content: "Redes neurais artificiais", correct: false },
        { content: "Aprendizado por reforço", correct: false },
        { content: "Aprendizado não supervisionado", correct: false },
        { content: "Algoritmos genéticos", correct: false }
      ]
    },
    { 
      content: "O que é uma rede neural artificial?", 
      answers: [
        { content: "Um modelo computacional inspirado na estrutura do cérebro humano", correct: true },
        { content: "Um sistema de armazenamento de dados em nuvem", correct: false },
        { content: "Uma técnica de criptografia de dados", correct: false },
        { content: "Um tipo de rede de computadores", correct: false },
        { content: "Um método de compressão de dados", correct: false }
      ]
    },
    { 
      content: "Qual linguagem de programação é amplamente utilizada para desenvolvimento de IA?", 
      answers: [
        { content: "Python", correct: true },
        { content: "Java", correct: false },
        { content: "C++", correct: false },
        { content: "JavaScript", correct: false },
        { content: "Ruby", correct: false }
      ]
    },
    { 
      content: "O que é o Aprendizado por Reforço?", 
      answers: [
        { content: "Uma técnica onde um agente aprende através de recompensas e punições", correct: true },
        { content: "Um método de aprendizado onde os dados não são rotulados", correct: false },
        { content: "Uma forma de aprendizado onde o modelo corrige seus próprios erros", correct: false },
        { content: "Um tipo de rede neural especializada", correct: false },
        { content: "Um processo de treinamento sem dados históricos", correct: false }
      ]
    },
    { 
      content: "O que significa NLP no contexto de IA?", 
      answers: [
        { content: "Natural Language Processing", correct: true },
        { content: "Neural Language Programming", correct: false },
        { content: "Networked Learning Protocol", correct: false },
        { content: "Natural Learning Process", correct: false },
        { content: "Neural Language Processing", correct: false }
      ]
    },
    { 
      content: "Qual das seguintes opções é uma aplicação comum de IA em produtos de consumo?", 
      answers: [
        { content: "Assistentes virtuais como Siri e Alexa", correct: true },
        { content: "Planilhas eletrônicas", correct: false },
        { content: "Serviços de hospedagem de sites", correct: false },
        { content: "Sistemas de controle de versão", correct: false },
        { content: "Criação de jogos tradicionais", correct: false }
      ]
    },
    { 
      content: "O que é Deep Learning?", 
      answers: [
        { content: "Um subset de aprendizado de máquina baseado em redes neurais profundas", correct: true },
        { content: "Um método de compressão de grandes volumes de dados", correct: false },
        { content: "Uma técnica de criptografia avançada", correct: false },
        { content: "Um tipo de software para visualização de dados", correct: false },
        { content: "Um protocolo de comunicação em redes neurais", correct: false }
      ]
    },
    { 
      content: "O que são dados de treinamento em IA?", 
      answers: [
        { content: "Dados usados para ensinar um modelo de IA a reconhecer padrões", correct: true },
        { content: "Dados que são ignorados durante o treinamento de um modelo", correct: false },
        { content: "Dados gerados automaticamente por um algoritmo", correct: false },
        { content: "Dados coletados após a implantação do modelo", correct: false },
        { content: "Dados usados para monitorar o desempenho do modelo", correct: false }
      ]
    },
    { 
      content: "Qual é a função de um classificador em aprendizado de máquina?", 
      answers: [
        { content: "Atribuir uma categoria a um conjunto de dados", correct: true },
        { content: "Dividir dados em subconjuntos menores", correct: false },
        { content: "Compressar dados para análise", correct: false },
        { content: "Classificar modelos de IA com base em desempenho", correct: false },
        { content: "Corrigir dados inconsistentes", correct: false }
      ]
    }
  ]
}
]


# Criação de quizzes, perguntas e respostas
quizzes_data.each do |quiz_data|
  create_quiz_with_questions(
    quiz_data[:title], 
    quiz_data[:description], 
    quiz_data[:image], 
    quiz_data[:questions_and_answers]
  )
end
puts "Banco de dados populado com os quizzes adicionais!"

