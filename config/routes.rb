Rails.application.routes.draw do
  resources :attachments
  devise_for :users
  root :to => "home#index"
  post '/share', to: 'share#create'
  get '/share', to: 'share#index', as: :share_url
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
