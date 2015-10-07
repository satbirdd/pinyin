Rails.application.routes.draw do
  root "papers#index"
  devise_for :users

  resources :letters, only: [:index, :show]
  resources :paper_letters, only: [:index, :show]

  resources :papers, only: [:index, :show] do
    resources :tests do
      member do
        post :read_correct
        post :read_wrong
        post :finish
      end
    end
  end

  namespace :admin do
    resources :letters
    resources :papers
  end
end
