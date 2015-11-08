Rails.application.routes.draw do
  get 'urls/show'

  get 'urls/create'

  resources :urls, only: [:create]
end
