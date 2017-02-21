Rails.application.routes.draw do

    root 'galleries#index'

    resources :galleries, only: [:index, :show]

    namespace :admin do
    resources :galleries
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
