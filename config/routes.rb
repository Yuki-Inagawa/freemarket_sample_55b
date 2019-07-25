Rails.application.routes.draw do
  get '/extra_view' => 'jinno#extra'
  get '/jinno' => 'jinno#global_footer'
  get '/jinno/global_top_index' => 'jinno#global_top_index'
  get '/jinno/mypage/identification' => 'jinno#mypage'
  get '/asakura' => 'asakura#show'
  get '/inagawa/item/detail' => 'inagawa#item_detail'
  get '/noguchi' => 'noguchi#noguchi'

  resources :yukawa do
    collection do
      get 'registration'
      get 'sms_confirmation'
      get 'address'
      get 'how_pay'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
