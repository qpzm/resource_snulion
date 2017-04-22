Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'visitors#index'
  concern :invitable do
    resources :members, shallow: true
  end
  resources :visitors
  resources :places, concerns: :invitable 

end
