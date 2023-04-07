Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'pokemons/index'
      get 'pokemons/show'
      get 'pokemons/create'
      get 'pokemons/update'
      get 'pokemons/destroy'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
