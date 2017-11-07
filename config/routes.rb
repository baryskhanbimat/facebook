Rails.application.routes.draw do
  resources :friendships
  get 'home/list'
  root 'posts#index'

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  resources :posts do
    resources :comments
  end
  get 'user/index'
  get 'user/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
