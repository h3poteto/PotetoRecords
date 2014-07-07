Rails.application.routes.draw do
  devise_for :users


  resources :friends do
    member do
      get :show_menu
    end
  end
  resources :menurecords, only: [:index, :show, :new, :create]

  root :to => "menurecords#index"
end
