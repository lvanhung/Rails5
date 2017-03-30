Rails.application.routes.draw do
  get 'messages/create'

  get 'messages/index'

  get 'books/index'

  resources :posts
  resources :books
  resource :messages
  devise_for :users

  get 'static_pages/home'

  get 'static_pages/help'

  get 'static_pages/about'

  root 'welcome#index'

  mount ActionCable.server, at: '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
