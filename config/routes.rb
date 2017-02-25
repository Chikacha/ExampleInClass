Rails.application.routes.draw do
  root 'orders#index'

  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create]
  get '/register', to: 'users#new'
  resources :orders do
    member do # 客製化連結
      post :vote
      # 這樣會產出 orders/1/vote
    end
    # 嵌套/巢狀路由，這樣可以產生出 orders/1/comments/ 的 url
    resources :comments, only: [:create] do
      member do
        post :vote
        # 產出 orders/1/comments/1/vote
      end
    end
  end
end
