RedirectorUi::Engine.routes.draw do
  resources :redirect_rules

  root to: 'redirect_rules#index'
end
