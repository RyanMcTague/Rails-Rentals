Rails.application.routes.draw do
  root 'main#index'

  get 'movies', to: 'movies#index_view'
  get 'movies/new', to: 'movies#new_view'
  post 'movies/new', to: 'movies#create'
  get 'movies/admin', to: 'movies#admin_view'
  get 'movies/:id', to: 'movies#show_view', as: 'movie_show_view'
  post 'movies/activate/:id', to: 'movies#activate', as: 'activate_movie'
  post 'movies/remove/:id', to: 'movies#remove', as: 'remove_movie'

  get 'users', to: 'users#current_view'
  get 'users/new', to: 'user_registrations#new_view'
  post 'users/new', to: 'user_registrations#create'
  get 'users/login', to: 'user_sessions#new_view'
  post 'users/login', to: 'user_sessions#create'
  delete 'users/logout', to: 'user_sessions#destroy'
  get 'users/admin', to: 'admin#index_view', as: 'admin'

  get 'rentals', to: 'rentals#index_view'
  get 'rentals/new', to: 'rentals#new_view'
  post 'rentals/new', to: 'rentals#create'
  get 'rentals/active', to: 'rentals#active_view'
  post 'rental/return/:id', to: 'rentals#return_rental', as: 'return_rental'
  delete 'rentals/:id', to: 'rentals#destroy', as:'remove_rental'

  get 'transaction/rate/:id', to: 'ratings#new_view', as:'rate_rental_view'
  post 'transaction/rate/:id', to: 'ratings#create', as:'rate_rental'
  get 'transaction/:id', to: 'rental_transactions#index_view', as: 'transaction_view'

  post 'cart/add/:id', to: 'cart#add_rental_to_cart', as: 'add_to_cart'
  delete 'cart/remove/:id', to: 'cart#remove_rental_from_cart', as: 'remove_from_cart'

  resources :rental_charges, only: [:new, :create]
end
