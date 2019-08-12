Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :omniauth_callbacks =>  "users/omniauth_callbacks"
  }
  devise_scope :user do
    get 'login', to: 'users/sessions#new'
  end


  root 'items#index'
  resources :items do
    resources :comments, only: [:create]
    resource :likes, only: [:create, :destroy]
    collection do

    get 'buy/confirmation', to: 'items#buy_confirmation'
    get 'search', to: 'items#search'
    get 'get_category_children', defaults: { format: 'json' }
    get 'get_category_grandchildren', defaults: { format: 'json' }

    end
    resources :transaction, only: [:index] do
      collection do
        post 'pay'
      end
    end
  end

  resources :users, only: [:show]


  resources :mypages, only: [:show] do
      get 'profile', on: :member
      get 'listing_list',  on: :member
      get 'listing_completed',  on: :member
      get 'identification',  on: :member
      get 'card',  on: :member
      get 'card_create',  on: :member
      get 'logout',  on: :member
    end

  resources :categories, only: [:index] 


  # 新規登録画面
  resources :signup, only: [:index, :create] do
    collection do
      get 'registration'
      get 'sms_confirmation'
      get 'address'
      get 'how_pay'
      get 'clear_compleate'
    end
  end
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
