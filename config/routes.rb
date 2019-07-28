Rails.application.routes.draw do

  devise_for :users
  
  root 'items#index'
  resources :items, only: [:index, :new, :show, :create] do
    collection do
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
      get 'registration' 
      get 'sms_confirmation'
      get 'address'
      get 'how_pay'
      get 'clear_compleate'
      get 'login'
      get 'signup'
      get 'show' #現状idがないため model生成後 showに直す
    end
  end
end
