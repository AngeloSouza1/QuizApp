Rails.application.routes.draw do
  root 'home#index'

  get 'dashboard', to: 'dashboards#show', as: 'user_dashboard'

  devise_for :admins, path: 'admins'
  devise_for :users, path: 'users'

  resources :quizzes, only: [:index, :show] do
    member do
      post :answer
    end
    resources :questions, only: [:index, :show]
  end

  namespace :admin do
    root to: 'dashboards#show', as: 'root'

    resources :quizzes, only: [:index, :show] do
      member do
        delete :remove_image
      end

      resources :questions, only: [:new, :create, :edit, :update, :destroy] do
        resources :answers, only: [:create, :update, :destroy]
      end
    end

    resources :rankings, only: [:index]
    resources :progress, only: [:index]
  end
end
