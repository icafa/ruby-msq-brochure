Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homepage#mainpage"

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
      confirmations: 'users/confirmations',
      unlocks: 'users/unlocks'
    }

  resources :homepage do
    collection do
      get :mainpage
    end
  end
  resources :brochures, :only => [:new, :create ] do
    collection do
      post :add_individual_page
      get :property
      get :itemdetail
      post :brochures_area_change
    end
  end
end
