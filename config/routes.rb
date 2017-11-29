Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :book_suggestions, only: [:new,:show]

  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :book_suggestions, only: [:create]
    get '/books/isbn' => 'books#isbn'
    resources :books, only: [:show, :index]
    resources :users do
      resources :rents
      collection do
          resources :sessions, only: [:create] do
            collection do
              post '/' => 'authentication#create'
              post '/renew' => 'authentication#renew'
              post '/invalidate_all' => 'authentication#invalidate_all'
            end
          end
      end
    end
  end

  resources :open_library
  root to: "landing#index"
end
