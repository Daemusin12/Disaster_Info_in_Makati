Rails.application.routes.draw do
  get 'users/index'
  devise_for :users

  root 'posts#index'

  resources :posts do
    resources :comments, except: :show
  end
  resources :disasters, except: :show
end
