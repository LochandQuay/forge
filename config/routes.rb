Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    devise_for :users, controllers: {
      sessions: 'api/users/sessions', 
      passwords: 'api/users/passwords',
      registrations: 'api/users/registrations',
      unlocks: 'api/users/unlocks'
    }
  end

  root to: 'static_pages#root'
end
