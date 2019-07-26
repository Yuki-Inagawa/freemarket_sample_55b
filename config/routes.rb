Rails.application.routes.draw do
  devise_for :signups
  get '/extra_view' => 'jinno#extra'
  get '/jinno' => 'jinno#global_footer'
  get '/jinno/global_top_index' => 'jinno#global_top_index'
  get '/jinno/mypage/identification' => 'jinno#mypage_identification'
  get '/asakura' => 'asakura#show'
  get '/inagawa/item/detail' => 'inagawa#item_detail'
  get '/noguchi' => 'noguchi#noguchi'

  # 湯川淳輝のルーティング
  resources :signup do
    collection do
      get 'registration'
      get 'sms_confirmation'
      get 'address'
      get 'how_pay'
      get 'clear_compleate'
      get 'login'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
