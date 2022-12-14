Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :campers, only:[:index, :show, :create]
  resources :signups, only:[:create]
  resources :activities, only:[:index, :destroy]
end
