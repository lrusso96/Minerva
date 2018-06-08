Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/contact',    to: 'static_pages#contact'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users, only: [:show, :index] do
    resources :papers
  end
end
