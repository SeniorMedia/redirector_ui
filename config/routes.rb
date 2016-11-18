RedirectorUi::Engine.routes.draw do
  resources :redirect_rules, only: [ :index, :edit, :update, :destroy ]

  root to: 'redirect_rules#index'
end
