Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  # resources :projects

  resources :users do
	resources :projects  	
  end

  post    'sessions'     => 'sessions#create'
  delete  'sessions/:id' => 'sessions#destroy'

end
