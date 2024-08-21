Rails.application.routes.draw do
  # Página inicial
  root 'home#index'

  # Rotas para Dashboards dos usuários
  get 'dashboard', to: 'dashboards#show', as: 'user_dashboard'
  
  # Devise routes para administradores e usuários
  devise_for :admins, path: 'admins'
  devise_for :users, path: 'users'

  # Rotas para quizzes e suas sub-rotas para usuários
  resources :quizzes, only: [:index, :show] do
    member do
      post :answer  # Usando POST para enviar respostas
    end
    resources :questions, only: [:index, :show]
  end

  # Namespace admin para centralizar todas as rotas administrativas
  namespace :admin do
    root to: 'dashboards#show', as: 'root'
    
    resources :quizzes do
      member do
        delete :remove_image  # Rota para remover a imagem de um quiz
      end
      
      resources :questions do
        resources :answers, only: [:new, :create, :edit, :update, :destroy, :show]  # Incluindo a ação show para respostas
      end
    end

    resources :rankings, only: [:index]
    resources :progress, only: [:index]
  end
end
