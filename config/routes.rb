Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: redirect('/photos/')

  get 'photos/', to: 'photos#index', as: 'photos'
  post 'photos', to: 'photos#create'
  get 'photos/new', to: 'photos#new', as: 'new_photo'

  get 'profiles/', to: 'profiles#show', as: 'profile'

end
