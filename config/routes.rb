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

    resources :cards, defaults: { format: :json }, only: [:index, :show]
  end

  get '/cards', to: 'api/cards#index'
  get '/cards/:id', to: 'api/cards#show'
  get '/class/:player_class', to: 'api/cards#index'
  get '/rarity/:rarity', to: 'api/cards#index'
  get '/cost/:cost', to: 'api/cards#index'
  get '/attack/:attack', to: 'api/cards#index'
  get '/health/:health', to: 'api/cards#index'
  get '/race/:race', to: 'api/cards#index'
  get '/type/:card_type', to: 'api/cards#index'
  get '/set/:card_set', to: 'api/cards#index'


  root to: 'static_pages#root'
end
