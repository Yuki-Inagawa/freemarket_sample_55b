Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    get 'login', to: 'users/sessions#new'
  end


  root 'items#index'
  resources :items, only: [:index, :new, :show, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create]
    collection do

    get 'buy/confirmation', to: 'items#buy_confirmation'

    end
  end

  resources :users, only: [:index, :show] do
    collection do
      get 'logout'
      get ':id/identification' => 'users#mypage_identification'
      get ':id/profile' => 'users#profile'
      get ':id/card'   => 'users#mypage_card'
      get ':id/card/create' => 'users#mypage_card_create'
      get ':id/listing/list' => 'users#mypage_listing_list'
      get 'login'
      get 'show' #現状idがないため model生成後 showに直す
    end
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
