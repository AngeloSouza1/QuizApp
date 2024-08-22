# QuizApp

<div align="justify">
QuizApp é um aplicativo web de quizzes desenvolvido com Ruby on Rails. Ele permite que os usuários testem seus conhecimentos em diferentes áreas através de quizzes interativos. O aplicativo suporta a criação de quizzes, perguntas, respostas e gerencia os usuários que participam dos quizzes.</div>

### 💻 Sobre o projeto
---

<div align="justify">
O objetivo principal do QuizApp é proporcionar uma plataforma interativa e fácil de usar para criar, gerenciar e participar de quizzes em diversas áreas de conhecimento, incentivando o aprendizado e a avaliação de forma divertida e acessível.

#### 👁️‍🗨️ Funcionalidades Principais

🔹 Criação e gerenciamento de quizzes: Adicione e edite quizzes com perguntas e respostas.

🔹 Organização de conteúdo: Categorize perguntas e respostas dentro de cada quiz.

🔹 Sistema de usuário: Autenticação e autorização para diferentes tipos de usuários (Admin e Usuário Comum).

🔹 Imagens para quizzes: Suporte para adicionar imagens personalizadas a cada quiz usando CarrierWave.

🔹 Interface interativa: Listagem de quizzes disponíveis com links para iniciar os quizzes.

</div>

#### 🛠 Tecnologias utilizadas

O projeto QuizApp é desenvolvido utilizando as seguintes tecnologias e gems:

🔹 Ruby on Rails: Framework principal para o desenvolvimento do backend e frontend.

🔹 PostgreSQL: Banco de dados utilizado para armazenar informações dos quizzes, perguntas, respostas e usuários.

🔹 Devise: Gem utilizada para autenticação de usuários.

🔹 CarrierWave: Gem utilizada para upload e gerenciamento de imagens.

🔹 Bootstrap: Framework de CSS utilizado para estilizar a interface do usuário.

🔹 Font Awesome: Utilizado para ícones na interface.

---

### 💡 Veja!

🔹 Imagens 


 Imagens dos Perfis
 
<a href="https://github.com/user-attachments/assets/9eb76c2a-232b-4ddc-940c-826cc147e645">
  <img src="https://github.com/user-attachments/assets/9eb76c2a-232b-4ddc-940c-826cc147e645" width="250" height="150" alt="Tela Cadastro">
</a>

<a href="https://github.com/user-attachments/assets/612f51cd-670e-4ac7-a54d-458594b3a6ad">
  <img src="https://github.com/user-attachments/assets/612f51cd-670e-4ac7-a54d-458594b3a6ad" width="250" height="150" alt="Perfil Usuário">
</a>

<a href="https://github.com/user-attachments/assets/9ca64fb5-e128-4a50-b92e-8ed5cd51c6eb">
  <img src="https://github.com/user-attachments/assets/9ca64fb5-e128-4a50-b92e-8ed5cd51c6eb" width="250" height="150" alt="Gráfico de Acessos">
</a>

<a href="https://github.com/user-attachments/assets/eda2aa94-90d7-45a5-937c-509f38105fee">
  <img src="https://github.com/user-attachments/assets/9eb76c2a-232b-4ddc-940c-826cc147e645" width="250" height="150" alt="Tela Cadastro">
</a>

<a href="https://github.com/user-attachments/assets/0ac64890-481b-449d-99ec-d76165fe3fa3">
  <img src="https://github.com/user-attachments/assets/612f51cd-670e-4ac7-a54d-458594b3a6ad" width="250" height="150" alt="Perfil Usuário">
</a>

<a href="https://github.com/user-attachments/assets/9ca64fb5-e128-4a50-b92e-8ed5cd51c6eb">
  <img src="https://github.com/user-attachments/assets/9f80fde9-2652-4330-9370-a2eb85a0d55e" width="250" height="150" alt="Gráfico de Acessos">
</a>

<a href="https://github.com/user-attachments/assets/5ee55415-2d03-4c31-b0cf-359e6de1f443">
  <img src="https://github.com/user-attachments/assets/9eb76c2a-232b-4ddc-940c-826cc147e645" width="250" height="150" alt="Tela Cadastro">
</a>

<a href="https://github.com/user-attachments/assets/4466f3ca-ccc4-40c9-a274-c8d5cddbbaaf">
  <img src="https://github.com/user-attachments/assets/612f51cd-670e-4ac7-a54d-458594b3a6ad" width="250" height="150" alt="Perfil Usuário">
</a>

<a href="https://github.com/user-attachments/assets/effe0a69-c771-42c8-a630-ec7d180c5a93">
  <img src="https://github.com/user-attachments/assets/9f80fde9-2652-4330-9370-a2eb85a0d55e" width="250" height="150" alt="Gráfico de Acessos">
</a>




<br>

🔹 Vídeos de demonstração

- Perfil Usuário

https://github.com/user-attachments/assets/204239fd-c2ea-4978-85e1-162b6f94e7a6


- Perfil Administrador

https://github.com/user-attachments/assets/b5af9090-7610-4542-a5fd-81c7a03f5bfd

---

##### Pré-requisitos

🔹 Ruby: Versão 3.1.0 ou superior.

🔹 Rails: Versão 7.0 ou superior.

🔹 PostgreSQL: Versão 13 ou superior.

Para executar a aplicação localmente em seu ambiente de desenvolvimento, siga estas etapas:

🔹 Clone o repositório:
  ```bash
git clone https://github.com/seu-usuario/QuizApp.git

```
🔹 Abra o diretório do projeto

```bash
cd QuizApp
```
🔹 Instale as dependências do projeto utilizando o Bundler:

  ```bash
bundle install
```
 🔹 Execute as migrações do banco de dados:

  ```bash
rails db:create
```
    
  ```bash
rails db:migrate
```

```bash
rails db:seed
```

 - O seed irá criar um administrador e um usuário padrão, além de popular o banco com quizzes iniciais.

 🔹 Inicie o servidor Rails:

  ```bash
bundle exec rails server
```

 🔹 Abra seu navegador e acesse a aplicação em http://localhost:3000.

---

##### Configuração de Imagens

As imagens dos quizzes são gerenciadas com a gem CarrierWave. Certifique-se de que as imagens necessárias estão localizadas na pasta app/assets/images ou faça o upload diretamente pela interface de administração.

##### Seeds Padrão

O seed padrão cria os seguintes usuários:

 🔹 Admin:

   - Email: admin@example.com

   - Senha: password123

 🔹 Usuário Comum:

   - Email: user@example.com

   - Senha: password123

 🔹 E popula o banco com quizzes inseridos.

---

### ✍️ Estrutura do Projeto

🔹 app/models: Modelos do banco de dados.

🔹 app/controllers: Lógica de controle do aplicativo.

🔹 app/views: Arquivos de visualização renderizados no navegador.

🔹 app/assets: Arquivos estáticos como CSS, JavaScript, e imagens.

🔹 app/uploaders: Uploaders de arquivos gerenciados pelo CarrierWave.

---


### 🌟 Como Usar o QuizApp

🔹 Acessando o Aplicativo:

   - Visite a página principal do QuizApp em http://localhost:3000 (ou na URL correspondente se estiver em produção).
 
   - Você verá uma lista de quizzes disponíveis para participar.
     
🔹 Participando de um Quiz:

  - Na página principal, clique em um quiz de seu interesse.
  
  - Leia as perguntas e selecione a resposta correta para cada uma delas.
  
  - Após responder todas as perguntas, envie suas respostas para ver seu resultado.

🔹 Criando e Gerenciando Quizzes (Acesso de Administrador):

  -  Faça login como administrador usando as credenciais fornecidas.
  
  -  No painel de administração, você pode:

     - Criar novos quizzes, adicionando perguntas e respostas

     - Editar quizzes existentes, alterando perguntas, respostas ou imagens.

     - Gerenciar usuários, incluindo a criação e remoção de contas.


🔹 Gerenciando Imagens:

  - Ao criar ou editar um quiz, você pode fazer upload de uma imagem associada ao quiz.
  
  - As imagens são gerenciadas através do CarrierWave e são armazenadas no diretório configurado pelo aplicativo.

🔹 Usuários e Acesso:

  - Usuários comuns: Podem visualizar e participar dos quizzes.

  - dministradores: Têm acesso a funcionalidades adicionais, como a criação e edição de quizzes e a gestão de usuários.

🔹 Resultados e Feedback:

  - Após completar um quiz, você receberá feedback imediato com a pontuação obtida e, opcionalmente, explicações sobre as respostas corretas.

O QuizApp é intuitivo, permitindo que tanto administradores quanto usuários comuns naveguem facilmente e utilizem a plataforma para criar, gerenciar, e participar de quizzes educacionais.

---
###  🤝🏻 Contribuição

Contribuições são bem-vindas! Se você quiser contribuir para o projeto, siga estas etapas:

🔹 Faça um fork do projeto.

🔹 Crie uma nova branch com a sua feature: git checkout -b minha-feature

🔹 Faça commit das suas alterações: git commit -m 'Adicionar nova feature'

🔹 Faça push para a branch: git push origin minha-feature

🔹 Envie um pull request.

---
### Licença
Este projeto é licenciado sob a MIT License.
---
### 📧 Contato
Para mais informações ou para relatar problemas, entre em contato pelo angeloafdesouza@gmail.com










