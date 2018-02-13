Rails.application.routes.draw do
  devise_for :users
  resources :strains
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#root"
end
