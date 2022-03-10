Rails.application.routes.draw do
  require 'sidekiq/web'

  mount Sidekiq::Web => "/sidekiq"
  get 'welcome/index'

  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
