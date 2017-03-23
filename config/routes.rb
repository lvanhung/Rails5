Rails.application.routes.draw do
  resources :posts
  devise_for :users
  # devise_for :users, controllers: {
  #     sessions: 'users/sessions'
  # }

  # devise_for :users, path: 'users', path_names:
  #     { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification',
  #       unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }


  get 'static_pages/home'

  get 'static_pages/help'

  get 'static_pages/about'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
