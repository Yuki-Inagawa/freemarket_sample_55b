Rails.application.routes.draw do
  get '/extra_view' => 'jinno#extra'
  get '/jinno' => 'jinno#jinno'
  get '/asakura' => 'jinno#asakura'
  get '/inagawa' => 'jinno#inagawa'
  get '/noguchi' => 'jinno#noguchi'
  get '/yukawa' => 'jinno#yukawa'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
