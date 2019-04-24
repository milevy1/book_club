Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Root landing page
  get '/', to: 'welcome_page#index', as: :root

  # Books
  get     '/books',          to: 'books#index'
  get     '/books/new',      to: 'books#new',   as: :new_book
  get     '/books/:id',      to: 'books#show',  as: :book
  post    '/books',          to: 'books#create'
  get     '/books/:id/edit', to: 'books#edit',  as: :edit_book
  patch   '/books/:id',      to: 'books#update'
  delete  '/books/:id',      to: 'books#destroy'

  # Reviews
  get '/books/:book_id/reviews/new', to: 'reviews#new',     as: :new_book_review
  post '/books/:book_id/reviews',    to: 'reviews#create',  as: :book_reviews
  get '/review/:id',                 to: 'reviews#show',    as: :user
  delete '/reviews/:id',             to: 'reviews#destroy', as: :review

  # Authors
  get '/authors/:id',    to: 'authors#show',  as: :author
  delete '/authors/:id', to: 'authors#destroy'

  # root 'welcome_page#index'

  # resources :books do
  #   resources :reviews, only: [:new, :create]
  # end
  # resources :authors, only: [:show, :destroy]
  #
  # resources :reviews, only: [:show], as: 'user'
  # resources :reviews, only: [:destroy]
end
