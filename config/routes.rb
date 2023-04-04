Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments, except: :show
  end
  resources :disasters, except: :show
end
