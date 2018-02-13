Rails.application.routes.draw do
  resources :retailers
  resources :effects
  devise_for :users
  resources :strains do
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#root"
end
