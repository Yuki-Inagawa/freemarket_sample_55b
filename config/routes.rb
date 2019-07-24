Rails.application.routes.draw do
  get '/extra_view' => 'jinno#extra'
  get '/jinno' => 'jinno#global_footer'
  get '/jinno/global_header' => 'jinno#global_header'
  get '/asakura' => 'asakura#show'
  get '/inagawa' => 'inagawa#inagawa'
  get '/noguchi' => 'noguchi#noguchi'
  get '/yukawa' => 'yukawa#yukawa'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
