Rails.application.routes.draw do
  devise_for :users, 
  path: '',
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  root to: "home#index"

  # namespace :api do
  #   namespace :v1 do
  #     post :sign_in, to: 'login#sign_in'
  #     post :refresh_token, to: 'login#refresh_token'
      
  #     resources :brands, except: :show
  #     resources :products, except: :show
  #     resources :variants, except: :show
  #   end
  # end
end
