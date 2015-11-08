Rails.application.routes.draw do
  resources :urls, only: [:show, :create]
end
