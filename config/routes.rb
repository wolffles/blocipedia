Rails.application.routes.draw do
  devise_for :users

  resources :charges, only: [:new, :create]

  resources :wikis

  post '/downgrading' => 'account#downgrading'

  get 'account' => 'account#index'

  get 'downgrade' => 'account#downgrade'

  root 'welcome#index'

end
