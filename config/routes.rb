Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: redirect('/photos/')

  get 'photos/', to: 'photos#index', as: 'photos'
  post 'photos', to: 'photos#create'
  get 'photos/new', to: 'photos#new', as: 'new_photo'
  get 'photos/:id', to: 'photos#show', as: 'photo'
  delete 'photos/:id', to: 'photos#destroy'

  get 'profiles/', to: 'profiles#show', as: 'profile'

  get 'follows', to: 'follows#index', as: 'follows'
  post 'follows', to: 'follows#create'
  delete 'follows', to: 'follows#destroy', as: 'follow'

  get 'photos/:photo_id/comments', to: 'comments#index', as: 'photo_comments'
  post 'photos/:photo_id/comments', to: 'comments#create'
  get 'photos/:photo_id/comments/new', to: 'comments#new', as: 'new_photo_comment'
  get 'photos/:photo_id/likes' , to: 'likes#create'
  get 'photos/:photo_id/favorites' , to: 'favorites#create'

  get 'explores/', to: 'explores#index', as: 'explores'

  get 'location', to: 'maps#location', as: 'location'

  post 'likes', to: 'likes#create'
  delete 'likes', to: 'likes#destroy', as: 'like'

  get 'favorites/', to: 'favorites#index', as: 'favorites'
  post 'favorites', to: 'favorites#create'
  delete 'favorites', to: 'favorites#destroy', as: 'favorite'


end
