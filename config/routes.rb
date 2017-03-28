Rails.application.routes.draw do

  root to: 'sessions#new'

  post '/sessions/create'

  post '/users/create'

  get '/groups' => 'groups#index'
  post 'groups/create'
  get 'groups/:id' => 'groups#show'
  delete 'groups/:id' => 'groups#destroy'

  post '/memberships/:id' => 'memberships#create'
  delete 'memberships/:id' => 'memberships#destroy'

  delete '/logout/:id' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
