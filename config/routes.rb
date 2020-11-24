Rails.application.routes.draw do
  get 'tasks/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'index', to: 'tasks#index'
  get 'index/:id', to: 'tasks#show', as: :show
end
