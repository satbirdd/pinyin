Rails.application.routes.draw do
  root "test_papers#index"

  resources :tests
  resources :letters, only: [:index, :show]
  resources :test_paper_letters, only: [:index, :show]
  resources :test_papers, only: [:index, :show]

  namespace :admin do
    resources :letters
    resources :test_papers
  end
end
