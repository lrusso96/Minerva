Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/contact', to: 'static_pages#contact'
  get  '/help', to: 'static_pages#help'
  get  '/about', to: 'static_pages#about'
  get '/explore', to: 'static_pages#explore'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users, only: %i[show index] do
    post 'follow',   to: 'socializations#follow'
    post 'unfollow', to: 'socializations#unfollow'
    resources :papers do
      post 'star',   to: 'socializations#star'
      post 'unstar', to: 'socializations#unstar'
    end
  end
end
