Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'weather#stuff'
  get '/currentconditions' => 'weather#current_conditions'
end
