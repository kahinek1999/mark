Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#home'
  resources :rentals, except: :destroy
  resources :posts
  resources :packages, except: :destroy do
    resources :reviews, only: %i[show create new]
  end
  get '/reviews/:id/confirmation', to: 'reviews#confirm', as: 'review_confirmation'
  get "/about", to: "pages#about"
  get "/faq", to: "pages#faq"
end
