Rails.application.routes.draw do
  resources :posts do
    resources :comments, except: :show
  end
  resources :disasters, except: :show
end
