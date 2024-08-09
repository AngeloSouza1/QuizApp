Rails.application.routes.draw do
  get 'dashboards/show'
  get 'home/index'
  # Devise routes para administradores e usuários
  devise_for :admins, path: 'admins'
  devise_for :users, path: 'users'

  # Página inicial para todos
  root 'home#index'
  
  # Namespace admin para centralizar todas as rotas de admin
  namespace :admin do
    root to: 'dashboards#show', as: 'root'
    resources :quizzes do
      resources :questions do
        resources :answers
      end
    end
  end

  # Rotas para usuário comum
  get 'dashboard', to: 'dashboards#show', as: 'user_dashboard'

  # Rotas para quizzes e suas sub-rotas
  resources :quizzes do
    member do
      get :answer
    end
    resources :questions do
      resources :answers
    end
  end
end
