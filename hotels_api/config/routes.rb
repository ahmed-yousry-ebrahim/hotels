Rails.application.routes.draw do
  resources :hotels, except: [:new, :edit] do
    collection do
      get 'search'
    end
  end
  resources :accomodation_types, only: [:index]
end
