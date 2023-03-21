Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/products/:id', to: 'products#show_by_id'
  get '/products', to: 'products#index'
  get '/products/search-by/:value/:order', to: 'products#order_by_title'
  post '/products/filter', to: 'products#filter', defaults: { format: :json }
  post '/cart/add', to: 'cart#add_to_cart', defaults: { format: :json }
  get '/cart', to: 'cart#search'
  delete '/cart/:id', to: 'cart#delete'
  patch '/cart/update', 'cart#update'
  post '/check-out', to: 'purchase#save', defaults: { format: :json }
end
