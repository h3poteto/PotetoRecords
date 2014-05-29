Rails.application.routes.draw do
  devise_for :users


  resources :friends
  resources :menurecords

  root :to => "menurecords#index"
end
