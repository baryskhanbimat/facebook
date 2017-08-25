Rails.application.routes.draw do
  get 'home/list'
  root 'home#list'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
