Rails.application.routes.draw do
  get '/extra_view' => 'jinno#extra'
  get '/jinno' => 'jinno#global_footer'
  get '/jinno/global_top_index' => 'jinno#global_top_index'
  get '/jinno/mypage/identification' => 'jinno#mypage'
  get '/asakura' => 'asakura#show'
  get '/inagawa' => 'inagawa#inagawa'
  get '/noguchi' => 'noguchi#noguchi'
  get '/yukawa' => 'yukawa#yukawa'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
