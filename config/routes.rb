Rails.application.routes.draw do
  # Página inicial
  root 'home#index'

  # Rotas para Dashboards
  get 'dashboard', to: 'dashboards#show', as: 'user_dashboard'
 

  
  # Devise routes para administradores e usuários
  devise_for :admins, path: 'admins'
  devise_for :users, path: 'users'

  # Rotas para quizzes e suas sub-rotas para usuários
  resources :quizzes, only: [:index, :show] do
    member do
      post :answer  # Usando post para enviar respostas
    end
    resources :questions, only: [:index, :show]
  end

  # Namespace admin para centralizar todas as rotas de admin
  namespace :admin do
    root to: 'dashboards#show', as: 'root'
    resources :quizzes do
      resources :questions do
        resources :answers, only: [:create, :update, :destroy]  # Limita as ações de answers no admin
      end
    end
  end
end
