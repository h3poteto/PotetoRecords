Rails.application.routes.draw do
  devise_for :users, :controllers =>{
    :registrations => 'users/registrations'
  }


  resources :friends do
    member do
      get :show_menu
    end
  end
  resources :menurecords, only: [:index, :show, :new, :create] do
    collection do
      post :delete
    end
  end

  root :to => "menurecords#index"
end
