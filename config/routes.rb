Rails.application.routes.draw do
  devise_for :users
  
  root to: 'items#index'
  resources :items, only: [:index, :new] do
    collection do
    get 'show' 
    get 'buy/confirmation', to: 'items#buy_confirmation'    
    end
  end
 
  resources :users, only: [:index] do
    collection do 
      get 'logout'             
      get 'mypage' 
      get 'mypage/identification' => 'users#mypage_identification'
      get 'mypage/profile' => 'users#profile'
      get 'mypage/card'   => 'users#mypage_card'
      get 'mypage/card/create' => 'users#mypage_card_create'
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
end
