Rails.application.routes.draw do
  namespace :api do
    resources :tweets, only: [:index, :create]
    get 'search', to: 'tweets#search'
  end

  #Do not place any routes below this one
  if Rails.env.production?
    get '*other', to: 'static#index'
  end
end
