Rails.application.routes.draw do
  root 'apps#index'
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :members do
    resources :apps
  end
end
