Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    get 'login', to: 'users/sessions#new'
  end


  root 'items#index'
  resources :items do
    resources :comments, only: [:create]
    collection do

    get 'buy/confirmation', to: 'items#buy_confirmation'
    get 'search', to: 'items#search'

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
      get 'identification',  on: :member
      get 'card',  on: :member
      get 'card_create',  on: :member
      get 'logout',  on: :member
    end


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
