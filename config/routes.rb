Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  root to: "home#index"

  namespace :api do
    namespace :v1 do
      post :sign_in, to: 'login#sign_in'
      post :sign_up, to: 'login#sign_up'
      post :refresh_token, to: 'login#refresh_token'
      
      resources :brands
      resources :products
      resources :variants
    end
  end
end
