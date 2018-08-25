Rails.application.routes.draw do

  mount Api::ApplicationApi => '/api'
  root 'topics#index'

  resources :topics do
    collection do
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
