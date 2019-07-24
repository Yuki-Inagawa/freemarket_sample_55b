Rails.application.routes.draw do
  get '/extra_view' => 'jinno#extra'
  get '/jinno' => 'jinno#footer'
  get '/asakura' => 'asakura#asakura'
  get '/inagawa' => 'inagawa#inagawa'
  get '/noguchi' => 'noguchi#noguchi'
  get '/yukawa' => 'yukawa#yukawa'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
