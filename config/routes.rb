Rails.application.routes.draw do

  devise_for :users

  resources :wikis do
    resources :collaborators, only: [:create, :destroy, :index]
  end

  resources :charges, only: [:new, :create]

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  
end
