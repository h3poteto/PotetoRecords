Rails.application.routes.draw do
  resources :menurecords

  devise_for :users

  root :to => "menurecords#index"
end
