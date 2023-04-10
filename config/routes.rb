Rails.application.routes.draw do
  get 'users/index'
  devise_for :users

  root 'short_url#index'

  resources :posts do
    resources :comments, except: :show
  end
  resources :disasters, except: :show
  get '/:short_url', to: 'short_url#show'
end
